package game {
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.soulgame.effects.*;
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.display.*;
	import flash.events.*;
	import game.*;
	import system.*;
	import flash.filters.ColorMatrixFilter;    
	import fl.motion.AdjustColor;
	
	public class Planet extends MovieClip{
	
		// PROPERTIES
		public static const ANGLE_SPEED:Number = 2;
		public static const DISABLED_ALPHA:Number = 1;
		public static const RADIUS1:Number = 20;
		public static const RADIUS2:Number = 50;
		public static const SKINS1:Array = [Planet2, Planet4, Planet5, Planet6];
		public static const SKINS2:Array = [Planet1, Planet2, Planet3, Planet4, Planet5, Planet6];
		public static const ZOOM_MARGIN:Number = 50;
		private static var _list:Array = [];
		
		private var _arrow:MovieClip;
		private var _derivX:Number;
		private var _derivY:Number;
		private var _direction:int;
		private var _distance:Number;
		private var _hasExplode:Boolean
		private var _link:Planet;
		private var _graphic:MovieClip;
		private var _originX:Number;
		private var _originY:Number;
		private var _radius:Number;
		private var _rotateSpeed:Number;
		private var _type:int;
		private var _tweenExplode:TweenLite;
		private var _tweenDrift:TweenLite;

		
		// CONSTRUCTOR
		public function Planet(pType:int, pX:int, pY:int, pDirection:int) {
			_list[_list.length] = this;
			
			// Parameters
			_originX = pX;
			_originY = pY;
			_type = pType;
			_direction = pDirection;
			
			// Init
			var PlanetClass:Class;
			if (_type == 1) {
				PlanetClass = SKINS1[Maths.randInt(SKINS1.length - 1)]
				_radius = RADIUS1;
				_rotateSpeed = Maths.rand(5) * Maths.giveSign();
				_arrow = new ArrowDirection;
				_arrow.scaleX = _direction; 
				this.addChild(_arrow);
			} else if (_type == 2) {
				PlanetClass = SKINS2[Maths.randInt(SKINS2.length - 1)]
				_radius = RADIUS2;
				_rotateSpeed = Maths.rand(1.1) * Maths.giveSign();
			}
			_graphic = new PlanetClass();
			this.addChildAt(_graphic, 0);
			_radius = _type == 1 ? RADIUS1 : RADIUS2;
			_reset();
			
			// Listeners
			Global.stage.addEventListener(GameEvents.RESET_LEVEL, _reset);
			Global.stage.addEventListener(GameEvents.TEST_LEVEL, _test);
			this.addEventListener(Event.REMOVED_FROM_STAGE, _removeEventListeners);
		}
		
		
		// METHODS
		public function collideBorder():Boolean {
			return (x > (790 - _radius) || x < _radius + 10 || y > (590 - _radius) || y < _radius + 10);
		}
		
		public function createLink(pPlanet:Planet) {
			_link = pPlanet;
			_distance = Maths.distance(this, pPlanet);
		}
		
		public function deleteLink ():void {
			_link = null;
			_distance = 0;
		}
		
		private function explode ():void {
			if (!_hasExplode) {
				this.removeEventListener(Event.ENTER_FRAME, _manage);
				_hasExplode = true;
				_killTweens();
				_tweenExplode = new TweenLite(this, 10, { alpha:0, scaleX:0.1, scaleY:0.1, ease:Bounce.easeOut, useFrames:true } );
				
				Sounds.explode.read(0.35 + _radius / 80);
				Sounds.readExplode(0.2 + _radius / 90);
				
				var coef:Number = scaleX * 1.7;
				Effects.particle(SparkParticle, 20 * scaleX, Main.game.effects, x, y, 3.5 * coef, 55, 1.15, true, false, 0.1, -1, 0, -1);
				Effects.particle(FireParticle, 20 * scaleX, Main.game.effects, x, y, 7 * coef, 15, 3 * coef);
				Main.game.failLevel();
			}
		}
		
		private function _getClosestBigPlanet():Planet {
			var dist:Number = 1000;
			var distTemp:Number;
			var closest:Planet;
			
			for each (var planet:Planet in _list) {
				if (planet.isBig) {
					distTemp = Maths.distance(this, planet);
					if (distTemp < dist) {
						dist = distTemp;
						closest = planet;
					}
				}
			}
			return closest;
		}
		
		private function _killTweens ():void {
			if (_tweenExplode != null) {
				_tweenExplode.kill();
			}
			if (_tweenDrift!= null) {
				_tweenDrift.kill();
			}
		}
		
		private function _manage(e:Event) {
			// Common
			rotation += _rotateSpeed;
			
			// Small Planet 
			if (_type == 1) {
				// Move
				if (_link != null) {
					if (Math.random() > 0.4) {
						var planetShadow:PlanetShadow = new PlanetShadow(x, y, 0.2, scaleX, 25);
						Main.game.effectsBack.addChild(planetShadow);
					}
					var angle:Number = Maths.angleBetween(_link, this) + (ANGLE_SPEED * -_direction);
					x = _link.x + Math.cos(Math.PI * angle / 180) * _distance;
					y = _link.y + Math.sin(Math.PI * angle / 180) * _distance;
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
		}

		private function _removeEventListeners (e:Event):void {
			this.removeEventListener(Event.ENTER_FRAME, _manage);
			Global.stage.removeEventListener(GameEvents.RESET_LEVEL, _reset);
			Global.stage.removeEventListener(GameEvents.TEST_LEVEL, _test);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, _removeEventListeners);
		}
		
		private function _reset (e:Event = null):void {
			_killTweens();
			if (_arrow != null) {
				_arrow.alpha = 1;
				_arrow.scaleX = _direction; 
			}
			alpha = 1;
			rotation = 0;
			x = _originX;
			y = _originY;
			resetScale();
			_hasExplode = false;
			this.removeEventListener(Event.ENTER_FRAME, _manage);
		}
		
		public function resetColor() {
			alpha = 1;
			filters = [];
		}
		
		public function resetScale ():void {
			scaleX = scaleY = _type == 2 ? 1 : RADIUS1/RADIUS2;
		}
		
		public function setGrey() {
			var color : AdjustColor;
			var colorMatrix : ColorMatrixFilter;
			var matrix : Array;
			color = new AdjustColor();
			color.brightness = 20;
			color.contrast = 20;
			color.hue = 0;
			color.saturation = -100;
			matrix = color.CalculateFinalFlatArray();
			colorMatrix = new ColorMatrixFilter(matrix);
			filters = [colorMatrix];
			alpha = DISABLED_ALPHA;
		}
		
		private function _test (e:Event):void {
			if (_arrow != null) {
				_arrow.alpha = 0;
			}
			
			// --- Drif if not linked
			if (_type == 1 && _link == null) {
				var target:Planet = _getClosestBigPlanet();
				_tweenDrift = new TweenLite(this, 35, { x:target.x, y:target.y, ease:Linear.easeIn, useFrames:true, onComplete:explode} );
			}
			
			this.addEventListener(Event.ENTER_FRAME, _manage);
		}
		
		override public function toString():String {
			var str:String = super.toString();
			return str.slice(8, str.length - 1);			
		}
		
		public function checkLinkBan(pPlanet:Planet) {
			return ((pPlanet != this) && (pPlanet.isBig != this.isBig) && (!this.hasLink || this.isBig));	
		}
		
		
		// GETTERS
		public static function get oneNotLinked ():Boolean {
			for (var i:int = 0; i < _list.length; i++) {
				var planet:Planet = _list[i] as Planet;
				if (planet.isSmall && !planet.hasLink) {
					return true;
				}
			}
			return false;
		}
		public function get direction():int {
			return _direction;
		}
		public function get hasExplode():Boolean {
			return _hasExplode;
		}
		public function get hasLink ():Boolean {
			return isSmall && _link != null;
		}
		public function get isBig ():Boolean {
			return _radius == RADIUS2;
		}
		public function get isSmall ():Boolean {
			return _radius == RADIUS1;
		}
		public function get link():Planet {
			return _link;
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
		public function set link(value:Planet):void {
			_link = value;
		}
		
		
		
		// ============================================================
		// EDITOR
		// ============================================================		
		public function getEditorData ():String {
			return '[' + _type + ', ' + _originX + ', ' + _originY + ', ' + _direction +']';
		}
		
		public function setCoordEditor(pX:int, pY:int):void {
			_originX = pX;
			_originY = pY;
		}
			
		public function setDirectionEditor(pDirection:int):void {
			_direction = pDirection;
			if (_arrow != null) {
				_arrow.scaleX = _direction; 
			}
		}
		
	}
	
}
