package game {
	
	import com.soulgame.effects.*;
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.display.*;
	import flash.events.*;
	import flash.ui.Keyboard;
	import system.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class LinkManager {
		
		// PROPERTIES
		private static var _clickedPlanet:Planet;
		private static var _clickedX:Number;
		private static var _clickedY:Number;
		private static var _down:Boolean;
		private static var _links:Vector.<Link>;
		private static var _linkSprite:Sprite;
		
		
		// METHODS
		
		private static function _checkIntersect(pP1x:Number, pP1y:Number, pP2x:Number, pP2y:Number, pLink:Link):Boolean {
			var x1:Number = pLink.littlePlanet.x - pLink.bigPlanet.x;
			var y1:Number = pLink.littlePlanet.y - pLink.bigPlanet.y;
			
			var x2:Number = pP1x - pLink.bigPlanet.x;
			var y2:Number = pP1y - pLink.bigPlanet.y;
			
			var x3:Number = pP2x - pLink.bigPlanet.x;
			var y3:Number = pP2y - pLink.bigPlanet.y;
			
			if (Maths.getDeterminant(x1, y1, x2, y2) * Maths.getDeterminant(x1, y1, x3, y3) <= 0) {
				x1 = pP2x - pP1x;
				y1 = pP2y - pP1y;
			
				x2 = pLink.bigPlanet.x - pP1x;;
				y2 = pLink.bigPlanet.y - pP1y;
			
				x3 = pLink.littlePlanet.x - pP1x;;
				y3 = pLink.littlePlanet.y - pP1y;
				
				return (Maths.getDeterminant(x1, y1, x2, y2) * Maths.getDeterminant(x1, y1, x3, y3))<= 0;
			} else {
				return false;
			}
			
		}
		private static function _click (e:MouseEvent):void {
			//trace("click");
			_clickedPlanet = getPlanetFocused();
			_down = true;
			_clickedX = e.stageX;
			_clickedY = e.stageY;
			
			if (_clickedPlanet != null && (_clickedPlanet.isBig || !_clickedPlanet.hasLink)) {
				Sounds.clickPlanet.read(0.3, 170);
				for each(var planet:Planet in Planet.list) {
					if (!planet.checkLinkBan(_clickedPlanet)) {
						planet.setGrey();
					}
				}
			}else {
				_clickedPlanet = null;
			}
		}
		
		public static function getPlanetFocused():Planet {
			var temp:Planet = null;
			for each(var planet:Planet in Planet.list) {
				if (Maths.distance(planet, Service.mouse) <= planet.radius) {
					temp = planet;
				}
			}
			return temp;
		}
		
		private static function _move(e:MouseEvent):void {
			if (_down) {
				_linkSprite.graphics.clear();
				_linkSprite.graphics.beginFill(0xFFFFFF, 0);
				_linkSprite.graphics.lineStyle(2, 0xFFFFFF);
				if (_clickedPlanet != null) {
					_linkSprite.graphics.moveTo(_clickedPlanet.x, _clickedPlanet.y);
				}else {
					_linkSprite.graphics.moveTo(_clickedX, _clickedY);
				}
				_linkSprite.graphics.lineTo(e.stageX, e.stageY);
				
				Effects.particle(SparkParticle, 1, Main.game.effects, e.stageX, e.stageY, 2, 18, 0.6, true);
			}
		}
		
		private static function _release (e:MouseEvent):void {
			Service.readContainer(Main.game.links, 'LINKS CONTAINERES');
			
			for each(var planet:Planet in Planet.list) {
				planet.resetColor();
			}
			_down = false;
			var _releasedPlanet:Planet = getPlanetFocused();
			var _releasedX:Number = e.stageX;
			var _releasedY:Number = e.stageY;
			if (_clickedPlanet != null && _releasedPlanet != null && _releasedPlanet.checkLinkBan(_clickedPlanet)){
				// --- Link
				var link:Link = new Link(_clickedPlanet, _releasedPlanet)
				Sounds.linkPlanet.read(.3);
				_links.push(link);
				Main.game.links.addChild(link);
			} else if (_clickedPlanet == null) {
				// --- Cut
				var linksTemp:Vector.<Link> = new Vector.<Link>();
				for each(var link:Link in _links) {
					if (_checkIntersect(_clickedX, _clickedY, _releasedX, _releasedY, link)) {
						link.littlePlanet.deleteLink();
						Sounds.pop.read(0.2);
						Main.game.links.removeChild(link);
					} else {
						linksTemp.push(link);
					}
				}
				_links = linksTemp;
			}
			_linkSprite.graphics.clear();
		}
		
		public static function removeLinks ():void {
			_links = new Vector.<Link>();
			Service.cleanContainer(Main.game.links, 0);
		}
		
		public static function reset ():void {
			_linkSprite = new Sprite();
			Main.game.linksTemp.addChild(_linkSprite);
			_down = false;
			Global.stage.addEventListener(MouseEvent.MOUSE_DOWN, _click);
			Global.stage.addEventListener(MouseEvent.MOUSE_UP, _release);
			Global.stage.addEventListener(MouseEvent.MOUSE_MOVE, _move);
		}
		
		public static function start ():void {
			removeLinks();
			reset();
		}
		
		public static function stop ():void {
			if (_linkSprite && _linkSprite.parent) {
				Main.game.linksTemp.removeChild(_linkSprite);
			}
			Global.stage.removeEventListener(MouseEvent.MOUSE_DOWN, _click);
			Global.stage.removeEventListener(MouseEvent.MOUSE_UP, _release);
			Global.stage.removeEventListener(MouseEvent.MOUSE_MOVE, _move);
		}
		
		
		
		// GETTERS
		static public function get clickedPlanet():Planet {
			return _clickedPlanet;
		}
		
		
		// SETTERS
		static public function set clickedPlanet(p:Planet):void {
			_clickedPlanet = p;
		}
		
	}

}