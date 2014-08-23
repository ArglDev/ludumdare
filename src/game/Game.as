package game {
	
	import com.soulgame.effects.BlackScreen;
	import com.soulgame.utils.*;
	import com.soulgame.system.*;
	import flash.display.*;
	import flash.events.*;
	import interfaces.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class Game extends GameCore {
		
		// PROPERTIES
		// --- Containers
		private var _content:Sprite;
		private var _effects:Sprite;
		private var _links:Sprite;
		private var _linksTemp:Sprite;
		private var _planets:Sprite;
		
		// --- Counter
		private var _currentLevel:int;
		private var _hasLost:Boolean;
		private var _isBuilding:Boolean;
		private var _isTesting:Boolean;
		
		// --- Misc.
		private var _grid:MovieClip;
		private var _background:MovieClip;
		
		
		// CONSTRUCTOR
		public function Game():void {
			_content 	= new Sprite();
			_effects 	= new Sprite();
			_links 		= new Sprite();
			_linksTemp	= new Sprite();
			_planets 	= new Sprite();
			_grid 		= new Grid();
			_background = new Background();
		}
		
		
		// METHODS
		public function failLevel ():void {
			if (!_hasLost) {
				_hasLost = true;
				Screens.levelFailed.show();
				Screens.gameButtons.hide() // (0.3);
				Screens.levelFailed.slide(0, 100, 0, 0, 1.2);
			}
		}
		
		public function restartLevel ():void {
			startLevel(_currentLevel);
		}
		
		public function resetLevel ():void {
			// Display List
			Screens.levelFailed.hide();
			Screens.levelComplete.hide();
			Screens.gameButtons.show();
			Service.cleanContainer(_effects, 0);
			Service.cleanContainer(_linksTemp, 0);
			
			_hasLost = false;
			_isBuilding = false;
			_isTesting = false;			
			
			LinkManager.reset();
			
			switchBuild();
		}

		public function startLevel (pId:int):void {
			_currentLevel 	= pId;
			_isTesting 		= false;
			_isBuilding 	= false;
			_hasLost 		= false;
			
			// Display List
			Service.cleanContainer(_links, 0);
			Service.cleanContainer(_linksTemp, 0);
			Service.cleanContainer(_planets, 0);
			Service.cleanContainer(_effects, 0);
			Service.cleanContainer(_content, 0);
			Service.cleanContainer(Global.stage, 1);
			
			Global.stage.addChild(_content);
			_content.addChild(_background);
			_content.addChild(_links);
			_content.addChild(_planets);
			_content.addChild(_effects);
			_content.addChild(_linksTemp);
			_content.addChild(_grid);
			Screens.topButtons.show();
			Screens.gameButtons.show();
			
			// Planets
			Planet.list = [];
			var planet:Planet;
			var data:Array = LevelData.DATA[pId];
			for (var i:int = 0; i < data.length ; i++) {
				planet = new Planet(data[i][0], data[i][1], data[i][2], data[i][3]);
				_planets.addChild(planet);
			}
			
			LinkManager.start();
			switchBuild();
			var blackScreen:BlackScreen = new BlackScreen(0, 15);
		}
		
		public function stopLevel ():void {
			LinkManager.stop();
		}
		
		public function switchBuild ():void {
			if (!_isBuilding) {
				LinkManager.reset();
				_links.visible = true;
				_background.gotoAndStop('build');
				_grid.alpha = 1;
				Screens.gameButtons.mode.text = 'BUILD';
				_isBuilding = true;
				_isTesting = false;
				Global.stage.dispatchEvent(new Event (GameEvents.RESET_LEVEL));
			}
		}
		
		public function switchTest ():void {
			if (!_isTesting) {
				LinkManager.stop();
				_links.visible = false;
				_background.gotoAndStop('test');
				_grid.alpha = 0;
				Screens.gameButtons.mode.text = 'TEST';
				_isBuilding = false;
				_isTesting = true;
				Global.stage.dispatchEvent(new Event (GameEvents.TEST_LEVEL));
			}
		}
		
		
		// GETTERS
		public function get content():Sprite {
			return _content;
		}
		public function get effects():Sprite {
			return _effects;
		}
		public function get links():Sprite {
			return _links;
		}
		public function get linksTemp():Sprite {
			return _linksTemp;
		}
		public function get hasLost():Boolean {
			return _hasLost;
		}
		public function get isBuilding():Boolean {
			return _isBuilding;
		}
		public function get isTesting():Boolean {
			return _isTesting;
		}
		public function get planets():Sprite {
			return _planets;
		}
		
		
		// SETTERS
		public function set hasLost(p:Boolean):void {
			_hasLost = p;
		}
	
	}

}