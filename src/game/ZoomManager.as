package game {
	
	import com.soulgame.system.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author PAC
	 */
	public class ZoomManager {
		
		private static var _scaleMin:Number = 1;
		
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
		
		private static function run(e:Event):void {
			var newScale:Number = Planet.farthestPlanetScale;
			if (newScale < _scaleMin) {
				_scaleMin = newScale;
				Main.game.content.scaleX = newScale;
				Main.game.content.scaleY = newScale;
				Main.game.content.x = 400 - 400 * newScale;
				Main.game.content.y = 300 - 300 * newScale;
			}
		}
	}
}