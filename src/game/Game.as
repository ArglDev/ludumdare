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
		private var _effectsBack:Sprite;
		private var _effectsInterface:Sprite;
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
		private var _background1:MovieClip;
		private var _background2:MovieClip;
		private static var _center:Point = new Point(400, 300);
		private var _delayWin:Delay;
		private var _failText:TextFieldMax;
		private var _winText:TextFieldMax;
		
		
		// METHODS
		public function buildLevel ():void {
			if (!_isBuilding) {
				if (_hasLost) {
					Screens.gameButtons.show();
					Service.cleanContainer(_effectsInterface, 0);
					Service.cleanContainer(_effectsBack, 0);
					Service.cleanContainer(_effects, 0);
					Service.cleanContainer(_linksTemp, 0);
					
					_hasLost = false;
					_isBuilding = false;
					_isTesting = false;	
				}
				ZoomManager.stop();
				LinkManager.reset();
				_failText.cancelWrite();
				_winText.cancelWrite();
				_delayWin.stop();
				_links.visible = true;
				_background1.grid.alpha = 0;
				_background2.alpha = 0;
				TweenLite.to(_background1.grid, 8, { alpha:1, useFrames:true } );
				_isBuilding = true;
				_isTesting = false;
				Global.stage.dispatchEvent(new Event (GameEvents.RESET_LEVEL));
				ButtonCore(Screens.gameButtons.buttonBuild).disable(0, 0);
				ButtonCore(Screens.gameButtons.buttonTest).enable();
				Screens.gameButtons.connectBar.alpha = 0;
				Screens.gameButtons.buttonNext.disable();
			}
		}
		
		private function _cleanGameSpace ():void {
			Service.cleanContainer(_content, 0);
			Service.cleanContainer(_effects, 0);
			Service.cleanContainer(_effectsBack, 0);
			Service.cleanContainer(_effectsInterface, 0);
			Service.cleanContainer(_links, 0);
			Service.cleanContainer(_linksTemp, 0);
			Service.cleanContainer(_planets, 0);
			Service.cleanContainer(Global.stage, 1);
			Service.readContainer(Main.game.effectsBack, 'EFFECTS BACK');
		}
		
		public function failLevel ():void {
			if (!_hasLost) {
				var flash:FlashScreen = new FlashScreen(Global.stage, 0.12, 6);
				_totalDeath ++;
				_hasLost = true;
				_failText.write(1, Failure.comment, 1);
				SaveManager.save();
				SaveManager.save();
				if (_delayWin != null) {
					_delayWin.stop();
				}
			}
		}
		
		public function init ():void {
			_content 			= new Sprite();
			_effects 			= new Sprite();
			_effectsBack 		= new Sprite();
			_effectsInterface 	= new Sprite();
			_links 				= new Sprite();
			_linksTemp			= new Sprite();
			_planets 			= new Sprite();
			_background1 		= new Background1();
			_background2		= new Background2();
			
			_delayWin	= new Delay((360 / Planet.ANGLE_SPEED), 1, 0, 11, _winLevel);;
			_failText	= new TextFieldMax(Screens.gameButtons, 400, 16, Texts.failText, '');
			_winText	= new TextFieldMax(Screens.gameButtons, 400, 510, Texts.winText, '');
		}
		
		private function _manageBar (e:Event):void {
			if (_delayWin.progress < 1 && !_hasLost) {
				Screens.gameButtons.connectBar.bar.scaleX = _delayWin.progress;
				Screens.gameButtons.connectBar.txt.text = 'STABILIZE ' + Maths.roundUp(_delayWin.progress * 100) + '%';
			} else {
				Global.stage.removeEventListener(Event.ENTER_FRAME, _manageBar);
			}
		}
		
		public function startLevel (pId:int):void {
			stopLevel();
			
			_currentLevel 	= pId;
			_isTesting 		= false;
			_isBuilding 	= false;
			_hasLost 		= false;
			
			// Display List
			Global.stage.addChild(_background1);
			Global.stage.addChild(_content);
			_content.addChild(_background2);
			_content.addChild(_links);
			_content.addChild(_effectsBack);
			_content.addChild(_planets);
			_content.addChild(_effects);
			_content.addChild(_linksTemp);
			Global.stage.addChild(_effectsInterface);
			Screens.topButtons.show();
			Screens.gameButtons.show();
			ButtonCore(Screens.gameButtons.buttonNext).disabledAlpha = 0;
			
			// Planets
			var planet:Planet;
			var dataLvl:Array = LevelData.DATA[pId];
			for (var p:int = 0; p < dataLvl.length ; p++) {
				planet = new Planet(dataLvl[p][0], dataLvl[p][1], dataLvl[p][2], dataLvl[p][3], dataLvl[p][4]);
				_planets.addChild(planet);
			}
			
			LinkManager.start();
			buildLevel();
			var blackScreen:BlackScreen = new BlackScreen(0, 15);
		}
		
		public function stopLevel ():void {
			_delayWin.stop();
			Planet.list = [];
			ZoomManager.stop();
			LinkManager.stop();
			_cleanGameSpace();
			Global.stage.removeEventListener(Event.ENTER_FRAME, _manageBar);
		}
		
		public function testLevel ():void {
			_failText.cancelWrite();
			_winText.cancelWrite();
			if (!_isTesting) {
				Service.cleanContainer(_effectsBack, 0);
				
				LinkManager.stop();
				ZoomManager.start();
				_links.visible = false;
				_background1.grid.alpha = 1;
				_background2.alpha = 1;
				TweenLite.to(_background1.grid, 8, { alpha:0, useFrames:true } );
				_isBuilding = false;
				_isTesting = true;
				
				if (!Planet.oneNotLinked) {
					_delayWin.start();
					Screens.gameButtons.connectBar.alpha = 1;
					Global.stage.addEventListener(Event.ENTER_FRAME, _manageBar);
				}
				
				Global.stage.dispatchEvent(new Event (GameEvents.TEST_LEVEL));
				ButtonCore(Screens.gameButtons.buttonTest).disable(0, 0);
				ButtonCore(Screens.gameButtons.buttonBuild).enable();
			}
		}
		
		private function _winLevel ():void {
			LevelData.setStatus(_currentLevel, 3);
			LevelData.setStatus(_currentLevel+1, 2);
			SaveManager.save();
			_delayWin.stop();
			_winText.write(1, 'LEVEL COMPLETE', 1);
			Sounds.successLong.read(0.9);
			Menu.createFirework(_effectsInterface, 400, 500);
			
			// --- Button next update
			if (_currentLevel < LevelData.nbLevels - 1) {
				Screens.gameButtons.buttonNext.enable();
			} else {
				Screens.gameButtons.buttonNext.disable();
			}
		}
		
		
		// GETTERS
		public function get background1():MovieClip {
			return _background1;
		}
		public function get background2():MovieClip {
			return _background2;
		}
		public function get content():Sprite {
			return _content;
		}
		public function get currentLevel():int {
			return _currentLevel;
		}
		public function get effects():Sprite {
			return _effects;
		}
		public function get effectsBack():Sprite {
			return _effectsBack;
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
		static public function get center():Point {
			return _center;
		}
			
	}

}