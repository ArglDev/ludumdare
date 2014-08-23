package game {
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.soulgame.effects.*;
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
		private var _derivX:Number;
		private var _derivY:Number;
		private var _direction:int;
		private var _distance:Number;
		private var _hasExplode:Boolean
		private var _link:Planet;
		private var _originX:Number;
		private var _originY:Number;
		private var _radius:Number;
		private var _type:int;

		
		// CONSTRUCTOR
		public function Planet(pType:int, pX:int, pY:int, pDirection:int) {
			_list[_list.length] = this;
			trace(_list)
			this.addChild(new Planet1);
			
			// Parameters
			_originX = pX;
			_originY = pY;
			_type = pType;
			if (_type == 1) {
				_radius = RADIUS1;
			}else {
				_radius = RADIUS2;
			}
			_direction = pDirection;
			
			_radius = _type == 1 ? RADIUS1 : RADIUS2;
			_reset();
			
			// Listeners
			Global.stage.addEventListener(GameEvents.BUILD_LEVEL, _build);
			Global.stage.addEventListener(GameEvents.RESET_LEVEL, _reset);
			if (_type == 1) {
				Global.stage.addEventListener(GameEvents.TEST_LEVEL, _test);
			}
			this.addEventListener(Event.REMOVED_FROM_STAGE, _removeEventListeners);
		}
		
		
		// METHODS
		private function _build (e:Event):void {
			_reset();
		}
	
		public function createLink(pPlanet:Planet) {
			_link = pPlanet;
			_distance = Maths.distance(this, pPlanet);
		}
		
		
		private function explode ():void {
			this.removeEventListener(Event.ENTER_FRAME, _manage);
			Effects.shake(Main.game.content, 10, 0, 0, (2 + Maths.rand(3)) * Maths.giveSign(), (2 + Maths.rand(3)) * Maths.giveSign());
			_hasExplode = true;
			TweenLite.to(this, 10, { alpha:0, scaleX:0.1, scaleY:0.1, ease:Strong.easeIn, useFrames:true } ); 
			Effects.particle(SparkParticle, 15, Main.game.effects, x, y, 4.5, 65, 1.2, true, false, 0, -1, 0, -1);
			Effects.particle(FireParticle, 15, Main.game.effects, x, y, 2.5, 50, 3, false, false, 0.05, -1, 0, -1);
		}
		
		private function _manage(e:Event) {
			// Move
			if (_distance > 0) {
				var angle:Number = Maths.angleBetween(_link, this) +1;
				x = _link.x + Math.cos(Math.PI * angle / 180) * _distance;
				y = _link.y + Math.sin(Math.PI * angle / 180) * _distance;
			} else {
				x += _derivX;
				y += _derivY;
			}
			
			// Collision screen
			if (x > (800 - _radius) || x < _radius || y > (600 - _radius) || y < _radius) {
				explode();
			}
			
			// Collision planets
			var planet:Planet;
			for (var i:int = 0; i < _list.length; i++) {
				planet = _list[i];
				if (!planet.hasExplode && planet != this && Maths.distance(this, planet) < (radius + planet.radius)) {
					explode();
					planet.explode();
				}
			}
		}

		private function _reset (e:Event = null):void {
			alpha = 1;
			x = _originX;
			y = _originY;
			scaleX = scaleY = _type == 2 ? 1 : RADIUS1/RADIUS2;
			rotation = 0;
			_distance = 0;
			_hasExplode = false;
			this.removeEventListener(Event.ENTER_FRAME, _manage);
		}
		
		private function _removeEventListeners (e:Event):void {
			this.removeEventListener(Event.ENTER_FRAME, _manage);
			Global.stage.removeEventListener(GameEvents.BUILD_LEVEL, _build);
			Global.stage.removeEventListener(GameEvents.RESET_LEVEL, _reset);
			Global.stage.removeEventListener(GameEvents.TEST_LEVEL, _test);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, _removeEventListeners);
		}
		
		private function _test (e:Event):void {
			if (_distance == 0) {
				_derivX = (1 + Maths.rand(5)) * Maths.giveSign();
				_derivY = (1 + Maths.rand(5)) * Maths.giveSign();
			}
			this.addEventListener(Event.ENTER_FRAME, _manage);
		}
		
		
		// GETTERS
		public function get hasExplode():Boolean {
			return _hasExplode;
		}
		public function get isBig ():Boolean {
			return _radius == RADIUS2;
		}
		public function get isSmall ():Boolean {
			return _radius == RADIUS1;
		}

		
		public function get radius():Number {
			return _radius;
		}
		
		static public function get list():Array {
			return _list;
		}
		
		// SETTERS
		static public function set list(p:Array):void {
			_list = p;
		}
		
	}
	
}
