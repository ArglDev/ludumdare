package game {
	
	import com.greensock.*;
	import com.soulgame.effects.*;
	import com.soulgame.interfaces.*;
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import interfaces.*;
	import system.*;
	
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
		private var _totalDeath:int;
		
		// --- Misc.
		private var _background:MovieClip;
		private var _failComment:TextFieldMax;
		private static var _center:Point = new Point(400, 300);
		
		
		// CONSTRUCTOR
		public function Game():void {
			_content 	= new Sprite();
			_effects 	= new Sprite();
			_links 		= new Sprite();
			_linksTemp	= new Sprite();
			_planets 	= new Sprite();
			_background = new Background();
			
			_failComment = new TextFieldMax(Screens.gameButtons, 400, 16, Texts.failComment, '');
		}
		
		
		// METHODS
		private function _cleanGameSpace ():void {
			Service.cleanContainer(_links, 0);
			Service.cleanContainer(_linksTemp, 0);
			Service.cleanContainer(_planets, 0);
			Service.cleanContainer(_effects, 0);
			Service.cleanContainer(_content, 0);
			Service.cleanContainer(Global.stage, 1);
		}
		
		public function failLevel ():void {
			if (!_hasLost) {
				var flash:FlashScreen = new FlashScreen(_effects, 0.4, 6);
				_totalDeath ++;
				_hasLost = true;
				_failComment.write(1, Failure.comment, 1);
				SaveManager.save();
			}
		}
		
		public function restartLevel ():void {
			startLevel(_currentLevel);
		}
		
		private function _resetLevel ():void {
			// Display List
			Screens.levelComplete.hide();
			Screens.gameButtons.show();
			Service.cleanContainer(_effects, 0);
			Service.cleanContainer(_linksTemp, 0);
			
			_hasLost = false;
			_isBuilding = false;
			_isTesting = false;			
			
			LinkManager.reset();
		}

		public function startLevel (pId:int):void {
			stopLevel();
			
			_currentLevel 	= pId;
			_isTesting 		= false;
			_isBuilding 	= false;
			_hasLost 		= false;
			
			// Display List
			Global.stage.addChild(_content);
			_content.addChild(_background);
			_content.addChild(_links);
			_content.addChild(_planets);
			_content.addChild(_effects);
			_content.addChild(_linksTemp);
			Screens.topButtons.show();
			Screens.gameButtons.show();
			
			// Planets
			var planet:Planet;
			var data:Array = LevelData.DATA[pId];
			for (var i:int = 0; i < data.length ; i++) {
				planet = new Planet(data[i][0], data[i][1], data[i][2], data[i][3]);
				_planets.addChild(planet);
			}
			
			LinkManager.start();
			startBuild();
			var blackScreen:BlackScreen = new BlackScreen(0, 15);
		}
		
		public function startBuild ():void {
			_failComment.cancelWrite();
			if (_hasLost) {
				_resetLevel();
			}
			if (!_isBuilding) {
				_links.visible = true;
				_background.gotoAndStop('build');
				_isBuilding = true;
				_isTesting = false;
				Global.stage.dispatchEvent(new Event (GameEvents.RESET_LEVEL));
				ButtonCore(Screens.gameButtons.buttonBuild).disable(0, 0);
				ButtonCore(Screens.gameButtons.buttonTest).enable();
			}
		}
		
		public function startTest ():void {
			_failComment.cancelWrite();
			if (!_isTesting) {
				LinkManager.stop();
				ZoomManager.start();
				_links.visible = false;
				_background.gotoAndStop('test');
				_isBuilding = false;
				_isTesting = true;
				Global.stage.dispatchEvent(new Event (GameEvents.TEST_LEVEL));
				ButtonCore(Screens.gameButtons.buttonTest).disable(0, 0);
				ButtonCore(Screens.gameButtons.buttonBuild).enable();
			}
		}
		
		public function stopLevel ():void {
			Planet.list = [];
			LinkManager.stop();
			_cleanGameSpace();
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
		public function get totalDeath():int {
			return _totalDeath;
		}
		
		// SETTERS
		public function set hasLost(p:Boolean):void {
			_hasLost = p;
		}
		public function set totalDeath(p:int):void {
			_totalDeath = p;
		}
		
		static public function get center():Point 
		{
			return _center;
		}
	
	}

}