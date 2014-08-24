package interfaces {
	
	import com.soulgame.effects.*;
	import com.soulgame.interfaces.*;
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class Menu {
		
		private static function _clickLevel (e:MouseEvent):void {
			Main.game.startLevel(ButtonMax(e.currentTarget).id);
		}
		
		public static function init ():void {
			openTitle();
			
			// Level select buttons
			var button:ButtonMax;
			for (var i:int = 0; i < 50; i ++) {
				var l:int = i / 10;
				var c:int = i % 10;
				button = new ButtonMax (ButtonLevel, Screens.levelSelect, String(i + 1), 154 + 55 * c, 220 + 55 * l, _clickLevel, Texts.buttonLevel);
				button.rotation = -4 + Maths.randInt(6);
				button.id = i;
				button.disabledAlpha = 0;
			}
		}
		
		public static function openCredits ():void {
			Screens.credits.show(Global.stage, 0, 0, true, 0.7);
			Screens.credits.slide(0, 300);
		}
		
		public static function openLevelSelect ():void {
			Screens.levelSelect.show(Global.stage, 0, 0, true, 0.7);
			Screens.levelSelect.slide(0, 300);
		}
		
		public static function openTitle ():void {
			Main.game.stop();
			
			Screens.title.show();
			Screens.title.slide(0, 40, 0.15, 0, 1.2);
			Screens.topButtons.show();
			var blackScreen:BlackScreen = new BlackScreen(0, 20);
		}
	
	}

}