package game {
	
	import com.soulgame.utils.*;
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class StarGenerator extends Sprite {
		
		// CONSTRUCTOR
		public function StarGenerator():void {
			Service.cleanContainer(this, 0);
			this.addEventListener(Event.ENTER_FRAME, _init);
		}
		
		
		// METHODS
		private function _init (e:Event):void {
			this.removeEventListener(Event.ENTER_FRAME, _init);
			
			var star:MovieClip;
			for (var i:int = 0; i < _nb; i++) {
				star = new StarGenerated();	
				this.addChild(star);
				star.x = 400 - (_areaX * 0.5) + Maths.rand(_areaX);
				star.y = 300 - (_areaY * 0.5) + Maths.rand(_areaY);
				star.scaleX = Math.random() * _scale;
				star.scaleY = star.scaleX;
				star.alpha = Maths.limit(0.2 + scaleX - 0.35, 0, _alphaMax);
			}
		}
		
		
		//==================================
		// START SCALE
		//==================================
		protected var _scale:Number;
		[Inspectable (name = "Stars Scale", defaultValue = '0')]
		public function set scale (p:Number):void {
			_scale = p;
		}
		public function get scale ():Number {
			return _scale;
		}
		
		//==================================
		// AREA_X
		//==================================
		protected var _areaX:Number;
		[Inspectable (name = "Area X", defaultValue = '0')]
		public function set areaX (p:Number):void {
			_areaX = p;
		}
		public function get areaX ():Number {
			return _areaX;
		}
		
		//==================================
		// AREA_X
		//==================================
		protected var _areaY:Number;
		[Inspectable (name = "Area Y", defaultValue = '0')]
		public function set areaY (p:Number):void {
			_areaY = p;
		}
		public function get areaY ():Number {
			return _areaY;
		}
		
		//==================================
		// ALPHA_MAX
		//==================================
		protected var _alphaMax:Number;
		[Inspectable (name = "Alpha max", defaultValue = '0')]
		public function set alphaMax (p:Number):void {
			_alphaMax = p;
		}
		public function get alphaMax ():Number {
			return _alphaMax;
		}
		
		//==================================
		// NB STARS
		//==================================
		protected var _nb:int;
		[Inspectable (name = "Nb", defaultValue = '0')]
		public function set nb (p:int):void {
			_nb = p;
		}
		public function get nb ():int {
			return _nb;
		}
		
	}

}