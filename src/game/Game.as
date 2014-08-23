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
		private var _planets:Sprite;
		
		// --- Counter
		private var _currentLevel:int;
		private var _hasLost:Boolean;
		private var _isBuilding:Boolean;
		private var _isTesting:Boolean;
		
		
		
		// CONSTRUCTOR
		public function Game():void {
			_content = new Sprite();
			_effects = new Sprite();
			_planets = new Sprite();
		}
		
		
		// METHODS
		public function resetLevel ():void {
			_hasLost = false;
			_isBuilding = false;
			_isTesting = false;
			
			Service.cleanContainer(_effects, 0);
			
			Global.stage.dispatchEvent(new Event (GameEvents.RESET_LEVEL));
			
			var blackScreen:BlackScreen = new BlackScreen(0, 15);
		}

		public function startLevel (pId:int):void {
			_currentLevel 	= pId;
			_isTesting 		= false;
			_isBuilding 	= false;
			_hasLost 		= false;
			
			// Display List
			Service.cleanContainer(_planets, 0);
			Service.cleanContainer(_effects, 0);
			Service.cleanContainer(_content, 0);
			Service.cleanContainer(Global.stage, 2);
			
			Global.stage.addChild(_content);
			_content.addChild(_planets);
			_content.addChild(_effects);
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
			
			var blackScreen:BlackScreen = new BlackScreen(0, 15);
		}
		
		public function stopLevel ():void {
			LinkManager.stop();
		}
		
		public function switchBuild ():void {
			if (!_isBuilding) {
				_isBuilding = true;
				_isTesting = false;
				Global.stage.dispatchEvent(new Event (GameEvents.BUILD_LEVEL));
			}
		}
		
		public function switchTest ():void {
			if (!_isTesting) {
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
		public function get planets():Sprite {
			return _planets;
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
		
		
		// SETTERS
		public function set hasLost(p:Boolean):void {
			_hasLost = p;
		}
	
	}

}