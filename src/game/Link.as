package game {
	
	import com.greensock.*;
	import com.greensock.easing.*;
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
			// --- Planet defition
			if (pClicked.isBig) {
				_bigPlanet = pClicked;
				_littlePlanet = pReleased;
			} else {
				_bigPlanet = pReleased;
				_littlePlanet = pClicked;
			}
			
			// --- Tween
			_littlePlanet.resetScale();
			_bigPlanet.resetScale();
			var scale:Number = _littlePlanet.scaleX;
			TweenLite.from(_littlePlanet, 25, { scaleX:scale * 0.75, scaleY:scale * 0.75, ease:Elastic.easeOut, useFrames:true  } );
			scale = _bigPlanet.scaleX;
			TweenLite.from(_bigPlanet, 25, { scaleX:scale * 0.85, scaleY:scale * 0.85, ease:Elastic.easeOut, useFrames:true  } );
			
			// --- Link
			_littlePlanet.createLink(_bigPlanet);
			this.graphics.beginFill(0xFFFFFF, 0);
			this.graphics.lineStyle(2, 0xFFFFFF);
			this.graphics.moveTo(_littlePlanet.x, _littlePlanet.y);
			this.graphics.lineTo(_bigPlanet.x, _bigPlanet.y);
			var glowFilter:GlowFilter = new GlowFilter(0x00FFFF, 0.6, 2.5, 2.5);
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