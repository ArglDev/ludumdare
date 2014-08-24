package game {
	
	import com.soulgame.system.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author PAC
	 */
	public class ZoomManager {
		
		public static function start ():void {
			Global.stage.addEventListener(Event.ENTER_FRAME, run);
		}
		
		public static function stop ():void {
			Global.stage.removeEventListener(Event.ENTER_FRAME, run);
			Main.game.content.scaleX=1;
			Main.game.content.scaleY=1;
		}
		
		private static function run(e:Event):void {
			var newScale:Number = Planet.farthestPlanetScale;
			Main.game.content.scaleX = newScale;
			Main.game.content.scaleY = newScale;
			Main.game.content.x = 400 - 400 * newScale;
			Main.game.content.y = 300 - 300 * newScale;
		}
		
	}

}