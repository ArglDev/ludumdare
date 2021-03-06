package {
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.soulgame.effects.*;
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
	public class Main extends MovieClip {
	
		// PROPERTIES
		private static var _game:Game;
		private var _preloader:Preloader;
		
	
		// CONSTRUCTOR
		public function Main():void {
			stop();
			
			// Global
			Global.stage = stage;
			Global.main = stage.getChildAt(0) as DisplayObjectContainer;
			
			_game = new Game();
			_preloader = Service.findChild(this, Preloader) as Preloader;
			_loadGame();
		}
		
		
		// METHODS
		private function _init(e:Event = null):void {
			gotoAndStop(2);
			
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
			Screens.init();
			Main.game.init();
			LevelData.init();
			SaveManager.load();
			//Menu.init();
			Failure.init();
			LevelEditor.deactivate();
			
			// Sounds
			TextFieldMax.setSound (Sounds.typeLetter, 0.16, Sounds.tutu, 0.2, 1);
			ButtonCore.setSoundClick (Sounds.buttonClick, 0.30);
			ButtonCore.setSoundOver (Sounds.buttonOver, 0.15);
			
			// Misc.
			Sounds.clickPlanet.read(0.8);
			_preloader.removeEventListener(Event.COMPLETE, _init);
			_preloader.buttonPlayGame.y = 365;
			var filter:FilterFade = new FilterFade(_preloader.bar, 0.8, 0.1);
			TweenLite.from(_preloader.bar, 30, { useFrames:true, scaleY:0.7, ease:Elastic.easeOut } );
			TweenLite.from(_preloader.buttonPlayGame, 30, { useFrames:true, scaleX:0.2, scaleY:0.2, ease:Elastic.easeOut } );
			Effects.particle(SparkParticle, 25, _preloader, 580, 312, 5, 30, 1, true, false, 0.1, -1, -1, 0);
			Effects.particle(LinkParticle, 25, _preloader, 580, 312, 3, 25, 1, false, false, 0, -1, -1, 0);
		}
		
		private function _loadGame ():void {
			_preloader.setLoaderInfo(loaderInfo);
			_preloader.addEventListener(Event.COMPLETE, _init);
		}
		
			
		
		// GETTERS
		public static function get game ():Game {
			return _game;
		}
		
	}
	
}