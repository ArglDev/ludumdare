package game {
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.*;
	import game.*;
	import com.soulgame.utils.*;
	import com.soulgame.effects.*;

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
			
			addEventListener(Event.ENTER_FRAME, anime);
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
			var glowFilter:GlowFilter = new GlowFilter(0x00FFFF, 0.8, 5, 5);
			var blurFilter:BlurFilter = new BlurFilter();
			this.filters = [glowFilter,blurFilter];
		}
		
		private function anime(e:Event):void {
			var u:Number;
			var xU:Number;
			var yU:Number;
			for (var i:int; i < 5; i++) {
				u = Maths.rand(1);
				xU = _littlePlanet.x * u + _bigPlanet.x * (1 - u);
				yU = _littlePlanet.y * u + _bigPlanet.y * (1 - u);
				Effects.particle(SparkParticle, 1, Main.game.effects, xU, yU, 1, 30, 0.6, true);
			}
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