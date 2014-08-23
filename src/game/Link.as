package game 
{
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	import game.Planet;
	import flash.display.MovieClip;

	/**
	 * ...
	 * @author PAC
	 */
	public class Link extends MovieClip
	{
		
		private var _littlePlanet:Planet;
		private var _bigPlanet:Planet;
		
		public function Link(pLittlePlanet:Planet,pBigPlanet:Planet) 
		{
			_littlePlanet = pLittlePlanet;
			_bigPlanet = pBigPlanet;
			this.graphics.beginFill(0xFFFFFF, 0);
			this.graphics.lineStyle(5, 0xFFFFFF);
			this.graphics.moveTo(_littlePlanet.x, _littlePlanet.y);
			this.graphics.lineTo(_bigPlanet.x, _bigPlanet.y);
			var glowFilter:GlowFilter = new GlowFilter(0x00FFFF, 0.8, 10, 10);
			var blurFilter:BlurFilter = new BlurFilter();
			this.filters = [glowFilter,blurFilter];
		}
		
		public function get littlePlanet():Planet 
		{
			return _littlePlanet;
		}
		
		public function get bigPlanet():Planet 
		{
			return _bigPlanet;
		}
		
	}

}