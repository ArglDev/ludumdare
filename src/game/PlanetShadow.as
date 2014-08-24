package game {
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class PlanetShadow extends MovieClip {
		
		private var _tween:TweenLite;
		
		public function PlanetShadow(pX:Number, pY:Number, pAlpha:Number, pScale:Number, pDurationF:int):void  {
			x = pX;
			y = pY;
			scaleX = scaleY = pScale;
			alpha = pAlpha;
			_tween = new TweenLite(this, pDurationF, { useFrames:true, scaleX:pScale * 0.1, scaleY:pScale * 0.1, alpha:0, onComplete:_remove } );
			
			this.addEventListener(Event.REMOVED_FROM_STAGE, _removeListeners);
		}
		
		private function _remove ():void {
			if (parent) {
				parent.removeChild(this);
			} else {
				_removeListeners();
			}
		}
		
		private function _removeListeners (e:Event = null):void {
			this.removeEventListener(Event.REMOVED_FROM_STAGE, _remove);
			_tween.kill();
		}
	
	}

}