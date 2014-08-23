package game {
	
	import com.soulgame.utils.*;
	import com.soulgame.system.*;
	import flash.display.Sprite;
	import interfaces.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class Game extends GameCore {
		
		// PROPERTIES
		private var _planets:Sprite;
		
		
		// CONSTRUCTOR
		public function Game():void {
			_planets = new Sprite();
		}
		
		
		// METHODS
		public function startLevel (pId:int):void {
			Service.cleanContainer(Global.stage, 2);
			Service.cleanContainer(_planets, 0);
			
			Screens.gameButtons.show();
			Global.stage.addChild(_planets);
			
			// Planets
			Planet.list = [];
			var planet:Planet;
			var data:Array = LevelData.DATA[pId];
			for (var i:int = 0; i < data.length ; i++) {
				planet = new Planet(data[i][0], data[i][1], data[i][2], data[i][3]);
				_planets.addChild(planet);
			}
			
			LinkManager.start();
		}
		
		
		// GETTERS
		public function get planets():Sprite {
			return _planets;
		}
	
	}

}