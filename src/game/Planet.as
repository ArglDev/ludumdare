﻿package game {
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.soulgame.effects.*;
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.display.*;
	import flash.events.*;
	import game.*;
	import system.*;
	
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
		private var _tween:TweenLite;

		
		// CONSTRUCTOR
		public function Planet(pType:int, pX:int, pY:int, pDirection:int) {
			_list[_list.length] = this;
			//trace(_list)
			var PlanetClass:Class = Math.random() > 0.5 ? Planet1 : Planet2;
			this.addChild(new PlanetClass);
			
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
			Global.stage.addEventListener(GameEvents.RESET_LEVEL, _reset);
			if (_type == 1) {
				Global.stage.addEventListener(GameEvents.TEST_LEVEL, _test);
			}
			this.addEventListener(Event.REMOVED_FROM_STAGE, _removeEventListeners);
		}
		
		
		// METHODS
		public function createLink(pPlanet:Planet) {
			_link = pPlanet;
			_distance = Maths.distance(this, pPlanet);
		}
		
		public function deleteLink ():void {
			_link = null;
			_distance = 0;
		}
		
		private function explode ():void {
			this.removeEventListener(Event.ENTER_FRAME, _manage);
			Effects.shake(Main.game.content, 10, 0, 0, (2 + Maths.rand(3)) * Maths.giveSign(), (2 + Maths.rand(3)) * Maths.giveSign());
			_hasExplode = true;
			_tween = new TweenLite(this, 10, { alpha:0, scaleX:0.1, scaleY:0.1, ease:Bounce.easeOut, useFrames:true } );
			
			Sounds.explode.read(0.2 + _radius / 100);
			Sounds.readExplode(0.1 + _radius / 110);
			
			var coef:Number = scaleX * 1.7;
			Effects.particle(SparkParticle, 20 * scaleX, Main.game.effects, x, y, 3.5 * coef, 55, 1.15, true, false, 0.1, -1, 0, -1);
			Effects.particle(FireParticle, 20 * scaleX, Main.game.effects, x, y, 7 * coef, 15, 3 * coef);
			Main.game.failLevel();
		}
		
		private function _manage(e:Event) {
			// Move
			if (_link != null) {
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
			if (_tween) {
				_tween.kill();
			}
			alpha = 1;
			x = _originX;
			y = _originY;
			resetScale();
			rotation = 0;
			_hasExplode = false;
			this.removeEventListener(Event.ENTER_FRAME, _manage);
		}
		
		public function resetScale ():void {
			scaleX = scaleY = _type == 2 ? 1 : RADIUS1/RADIUS2;
		}
		
		private function _removeEventListeners (e:Event):void {
			this.removeEventListener(Event.ENTER_FRAME, _manage);
			Global.stage.removeEventListener(GameEvents.RESET_LEVEL, _reset);
			Global.stage.removeEventListener(GameEvents.TEST_LEVEL, _test);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, _removeEventListeners);
		}
		
		private function _test (e:Event):void {
			if (_link == null) {
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
