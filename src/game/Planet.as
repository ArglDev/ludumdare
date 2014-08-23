package game {
	
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.display.*;
	import flash.events.*;
	import game.*;
	
	public class Planet extends MovieClip{
	
		// PROPERTIES
		public static const RADIUS1:Number = 20;
		public static const RADIUS2:Number = 50;
		
		private static var _list:Array = [];
		private var _direction:int;
		private var _link:Planet;
		private var _originX:Number;
		private var _originY:Number;
		private var _radius:Number;
		private var _distance:Number;
		private var _type:int;
		
		
		// CONSTRUCTOR
		public function Planet(pType:int, pX:int, pY:int, pDirection:int) {
			_list[_list.length] = this;
			trace(_list)
			
			this.addChild(new Planet1);
			
			_originX = pX;
			_originY = pY;
			_type = pType;
			if (_type == 1) {
				_radius = RADIUS1;
			}else {
				_radius = RADIUS2;
			}
			_direction = pDirection;
			_reset();

			if(_type == 1){
				scaleX *= 0.40;
				scaleY *= 0.40;
			}
			
			Global.stage.addEventListener(GameEvents.BUILD_LEVEL, _build);
			Global.stage.addEventListener(GameEvents.RESET_LEVEL, _reset);
			Global.stage.addEventListener(GameEvents.TEST_LEVEL, _test);
			Global.stage.addEventListener(Event.REMOVED_FROM_STAGE, _removeEventListeners);
		}
		
		
		// METHODS
		private function _build (e:Event):void {
			
		}
	
		public function createLink(pPlanet:Planet) {
			_link = pPlanet;
			_distance = Maths.distance(this, pPlanet);
		}
		
		private function _move(e:Event) {
			if (_type == 2) {
				var a:Number = Maths.angleBetween(_link, this);
				a += 1;
				var Mx:Number = _link.x + Math.cos(Math.PI*a/180) * _distance;
				var My:Number = _link.y + Math.sin(Math.PI*a/180) * _distance;
				x = Mx;
				y = My;
			}
		}

		private function _reset (e:Event = null):void {
			x = _originX;
			y = _originY;
		}
		
		private function _removeEventListeners (e:Event):void {
			Global.stage.removeEventListener(GameEvents.BUILD_LEVEL, _build);
			Global.stage.removeEventListener(GameEvents.RESET_LEVEL, _reset);
			Global.stage.removeEventListener(GameEvents.TEST_LEVEL, _test);
			Global.stage.removeEventListener(Event.REMOVED_FROM_STAGE, _removeEventListeners);
		}
		
		private function _test (e:Event):void {
			
		}
		
		
		// GETTERS
		public function isSmall ():Boolean {
			return scaleX < 1;
		}
		
		public function get radius():Number {
			return _radius;
		}
		
		static public function get list():Array {
			return _list;
		}
		
		static public function set list(p:Array):void {
			_list = p;
		}
	}
	
}
