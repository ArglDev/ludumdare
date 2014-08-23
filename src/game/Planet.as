package game{
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.soulgame.utils.Maths;
	
	public class Planet extends MovieClip{
	
		private var _type:int;
		private var _link:Planet;
		private var _radius:Number;
		
		public function Planet(pX:int,pY:int,pType:int,pLink:Planet=null) {
			x=pX;
			y=pY;
			_type = pType;
			if(_type==2){
				scaleX *= 0.5;
				scaleY *= 0.5;
			}
			if (pLink != null) {
				createLink(pLink);
			}
			addEventListener(Event.ENTER_FRAME, move);
		}
		
		public function createLink(pPlanet:Planet) {
			_link = pPlanet;
			_radius = Maths.distance(this, pPlanet);
		}
		
		public function move(e:Event) {
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
