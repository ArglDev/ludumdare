package game {
	
	import com.soulgame.system.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author PAC
	 */
	public class ZoomManager {
		
		// PROPERTIES
		private static var _scaleMin:Number = 1;
		
		
		// METHODS
		public static function getFarthestPlanetScale():Number {
			var lowestScale:Number = 1;
			var distX:Number;
			var distY:Number;
			var newScaleX:Number;
			var newScaleY:Number;
			
			for each(var planet:Planet in Planet.list) {
				if (planet.isSmall) {
					distX = Math.abs(planet.x - 400) + planet.radius + Planet.ZOOM_MARGIN;
					distY = Math.abs(planet.y - 300) + planet.radius + Planet.ZOOM_MARGIN;
					newScaleX = 1;
					newScaleY = 1;
					if (distX > 400 ) {
						newScaleX = 400 / (distX);
						if (lowestScale > newScaleX) {
							lowestScale = newScaleX;
						}
					}
					if (distY > 300 ) {
						newScaleY = 300 / (distY);
						if (lowestScale > newScaleY) {
							lowestScale = newScaleY;
						}
					}
				}
			}
			return lowestScale;
		}
		
		private static function run(e:Event):void {
			var newScale:Number = getFarthestPlanetScale();
			if (newScale < _scaleMin) {
				_scaleMin = newScale;
				Main.game.content.scaleX = newScale;
				Main.game.content.scaleY = newScale;
				Main.game.content.x = 400 - 400 * newScale;
				Main.game.content.y = 300 - 300 * newScale;
			}
		}
		
		public static function start():void {
			_scaleMin = 1;
			Global.stage.addEventListener(Event.ENTER_FRAME, run);
		}
		
		public static function stop():void {
			Global.stage.removeEventListener(Event.ENTER_FRAME, run);
			Main.game.content.x = 0;
			Main.game.content.y = 0;
			Main.game.content.scaleX = 1;
			Main.game.content.scaleY = 1;
		}
		
	}
	
}