package game {
	
	import flash.display.*;
	import flash.filters.*;
	import game.*;

	/**
	 * ...
	 * @author PAC
	 */
	public class Link extends MovieClip {
		
		// PROPERTIES
		private var _littlePlanet:Planet;
		private var _bigPlanet:Planet;
		
		
		// CONSTRUCTOR
		public function Link(pClicked:Planet, pReleased:Planet):void {
			_littlePlanet = pClicked.isSmall ? pClicked : pReleased;
			_bigPlanet = pClicked.isBig ? pClicked : pReleased;
			
			_littlePlanet.createLink(_bigPlanet);
			
			this.graphics.beginFill(0xFFFFFF, 0);
			this.graphics.lineStyle(2, 0xFFFFFF);
			this.graphics.moveTo(_littlePlanet.x, _littlePlanet.y);
			this.graphics.lineTo(_bigPlanet.x, _bigPlanet.y);
			var glowFilter:GlowFilter = new GlowFilter(0x00FFFF, 0.8, 5, 5);
			var blurFilter:BlurFilter = new BlurFilter();
			this.filters = [glowFilter,blurFilter];
		}
		
		
		// GETTERS
		public function get littlePlanet():Planet {
			return _littlePlanet;
		}
		
		public function get bigPlanet():Planet {
			return _bigPlanet;
		}
		
	}

}