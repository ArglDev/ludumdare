package game{
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.soulgame.utils.Maths;
	
	public class Planet extends MovieClip{
	
		// PROPERTIES
		private var _direction:int;
		private var _link:Planet;
		private var _originX:Number;
		private var _originY:Number;
		private var _radius:Number;
		private var _type:int;
		
		
		// CONSTRUCTOR
		public function Planet(pType:int, pX:int, pY:int, pDirection:int) {
			this.addChild(new Planet1);
			
			x = pX;
			y = pY;
			_type = pType;
			
			if(_type == 1){
				scaleX *= 0.35;
				scaleY *= 0.35;
			}
			
			//this.addEventListener(Event.ENTER_FRAME, _move);
		}
		
		
		// METHODS
		public function createLink(pPlanet:Planet) {
			_link = pPlanet;
			_radius = Maths.distance(this, pPlanet);
		}
		
		private function _move(e:Event) {
			if (_type == 2) {
				var a:Number = Maths.angleBetween(_link, this);
				a += 1;
				var Mx:Number = _link.x + Math.cos(Math.PI*a/180) * _radius;
				var My:Number = _link.y + Math.sin(Math.PI*a/180) * _radius;
				x = Mx;
				y = My;
			}
		}

	}
	
}
