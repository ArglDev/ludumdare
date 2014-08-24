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
			
			// Init Library
			ButtonQuality.directApply = true;
			Settings.quality = 'high';
			Settings.applyQuality();
			Settings.volumeMax = 1.2;
			Settings.load();
			Settings.applyMute();
			Settings.sounds = true;
			Settings.music = true;
			
			// Init Project
			_game = new Game;
			LevelData.init();
			Menu.init();
			Failure.init();
			
			// Sounds
			TextFieldMax.setSound (Sounds.typeLetter, 0.35, Sounds.typeLetter, 0.45, 1);
			ButtonCore.setSoundClick (Sounds.buttonClick, 0.30);
			ButtonCore.setSoundOver (Sounds.buttonOver, 0.25);
		}
		
		
		// METHODS
		
		
		// GETTERS
		public static function get game ():Game {
			return _game;
		}
		
	}
	
}