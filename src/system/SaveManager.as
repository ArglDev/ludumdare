package system {
	
	import com.soulgame.interfaces.*;
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.events.*;
	import flash.net.*;
	import game.*;
	import interfaces.*;
	import system.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	
	public class SaveManager {
		
		// PROPERTIES
		private static var _save:SharedObject = SharedObject.getLocal('luda14');
		
		
		// METHODS
		public static function clear():void {
			_save.clear();

			LevelData.init();
			LevelData.initStatus();
			Failure.index = 0;
			Main.game.totalDeath = 0;
			
			save();
		}

		
		public static function load ():void {
			if (_save.data.levelsStatus != undefined) {
				Failure.index = _save.data.indexComment;
				Main.game.totalDeath = _save.data.totalDeath;
				LevelData.status = Service.cloneObject(_save.data.levelsStatus);
			//	Service.readObject(LevelData.status, 'LOAD  levelStatus');
			} else {
				Failure.index = 0; 
				Main.game.totalDeath = 0;
				LevelData.initStatus();
			//	Service.readObject(LevelData.status, 'INIT levelStatus');
			}
		}

		public static function save ():void {
			_save.data.indexComment = Failure.index;
			_save.data.totalDeath = Main.game.totalDeath;
			_save.data.levelsStatus = Service.cloneObject(LevelData.status);
			_save.flush();
		}
		
	}

}