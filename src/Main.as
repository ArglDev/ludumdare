package {
	
	import com.soulgame.interfaces.*;
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.display.*;
	import flash.events.*;
	import game.*;
	import interfaces.*;
	import system.*;
	
	
	/**
	 * ...
	 * @author Argl
	 */
	public class Main extends Sprite {
	
		// PROPERTIES
		private static var _game:Game;
		
	
		// CONSTRUCTOR
		public function Main():void {
			// Global
			Global.stage = stage;
			_game = new Game;
			
			// Library
			ButtonQuality.directApply = true;
			Settings.quality = 'high';
			Settings.applyQuality();
			Settings.volumeMax = 1.7;
			Settings.load();
			Settings.applyMute();
			
			// Project
			LevelData.init();
			Menu.init();
		}
		
		
		// METHODS
		
		
		// GETTERS
		public static function get game ():Game {
			return _game;
		}
		
	}
	
}