package game {
	
	import com.soulgame.effects.LightParticle;
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class LinkManager {
		
		// PROPERTIES
		private static var _linkSprite:Sprite;
		private static var _clickedPlanet:Planet;
		private static var _down:Boolean;
		private static var _clickedX:Number;
		private static var _clickedY:Number;
		
		private static var _links:Vector.<Link>;
		
		
		// METHODS
		private static function _click (e:MouseEvent):void {
			trace("click");
			_clickedPlanet = getPlanetFocused();
			_down = true;
			_clickedX = e.stageX;
			_clickedY = e.stageY;
		}
		
		private static function _manage (e:Event):void {
			
		}
		
		private static function _move(e:MouseEvent):void {
			if (_down) {
				trace("move");
				_linkSprite.graphics.clear();
				_linkSprite.graphics.beginFill(0xFFFFFF, 0);
				_linkSprite.graphics.lineStyle(2, 0xFFFFFF);
				if (_clickedPlanet != null) {
					_linkSprite.graphics.moveTo(_clickedPlanet.x, _clickedPlanet.y);
				}else {
					_linkSprite.graphics.moveTo(_clickedX, _clickedY);
				}
				_linkSprite.graphics.lineTo(e.stageX, e.stageY);
			}
		}
		
		private static function _release (e:MouseEvent):void {
			trace("release");
			_down = false;
			var _releasedPlanet:Planet = getPlanetFocused();
			var _releasedX:Number = e.stageX;
			var _releasedY:Number = e.stageY;
			
			if (_clickedPlanet != null && _releasedPlanet != null) {
				//LINK
				var link:Link = new Link(_clickedPlanet, _releasedPlanet)
				_links.push(link);
				Global.stage.addChild(link);
			}else if (_clickedPlanet == null) {
				//CUT
				var newLinks:Vector.<Link> = new Vector.<Link>();
				for each(var link:Link in _links) {
					if (checkIntersect(_clickedX, _clickedY, _releasedX, _releasedY, link)) {
						Global.stage.removeChild(link);
					}else {
						newLinks.push(link);
					}
				}
				_links = newLinks;
			}
			_linkSprite.graphics.clear();
		}
		
		public static function start ():void {
			_linkSprite = new Sprite();
			_links = new Vector.<Link>();
			Global.stage.addChild(_linkSprite);
			_down = false;
			Global.stage.addEventListener(MouseEvent.MOUSE_DOWN, _click);
			Global.stage.addEventListener(MouseEvent.MOUSE_UP, _release);
			Global.stage.addEventListener(MouseEvent.MOUSE_MOVE, _move);
		}
		
		
		public static function stop ():void {
			Global.stage.removeChild(_linkSprite);
			Global.stage.removeEventListener(MouseEvent.MOUSE_DOWN, _click);
			Global.stage.removeEventListener(MouseEvent.MOUSE_UP, _release);
			Global.stage.removeEventListener(MouseEvent.MOUSE_MOVE, _move);
		}
		
		private static function getPlanetFocused():Planet {
			var temp:Planet = null;
			for each(var planet:Planet in Planet.list) {
				if (Maths.distance(planet, Service.mouse) <= planet.radius) {
					temp = planet;
				}
			}
			return temp;
		}
		
		private static function checkIntersect(pP1x:Number, pP1y:Number, pP2x:Number, pP2y:Number, pLink:Link):Boolean {
			var x1:Number = pLink.littlePlanet.x - pLink.bigPlanet.x;
			var y1:Number = pLink.littlePlanet.y - pLink.bigPlanet.y;
			
			var x2:Number = pP1x - pLink.bigPlanet.x;
			var y2:Number = pP1y - pLink.bigPlanet.y;
			
			var x3:Number = pP2x - pLink.bigPlanet.x;
			var y3:Number = pP2y - pLink.bigPlanet.y;
			
			if (getDeterminant(x1, y1, x2, y2) * getDeterminant(x1, y1, x3, y3) <= 0) {
				x1 = pP2x - pP1x;
				y1 = pP2y - pP1y;
			
				x2 = pLink.bigPlanet.x - pP1x;;
				y2 = pLink.bigPlanet.y - pP1y;
			
				x3 = pLink.littlePlanet.x - pP1x;;
				y3 = pLink.littlePlanet.y - pP1y;
				
				return (getDeterminant(x1, y1, x2, y2) * getDeterminant(x1, y1, x3, y3))<= 0;
			}else {
				return false;
			}
			
		}
		
		// GETTERS
		static public function get clickedPlanet():Planet {
			return _clickedPlanet;
		}
		
		
		// SETTERS
		static public function set clickedPlanet(p:Planet):void {
			_clickedPlanet = p;
		}
	
		//MATHS
		static public function getDeterminant(pX1:Number, pY1:Number, pX2:Number, pY2:Number ) {
			return pX1 * pY2 - pY1 * pX2;
		}
	}

}