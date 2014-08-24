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
		private static var _save:SharedObject = SharedObject.getLocal('ludargl4102/save');
		
		
		// METHODS
		public static function clear():void {
			_save.clear();

			LevelData.init();
			Failure.index = 0;
			
			save();
		}

		
		public static function load ():void {
			if (_save.data.levelsStatus != undefined) {
				LevelData.status = Service.cloneObject(_save.data.levelsStatus);
			} else {
				Failure.index = 0; 
				LevelData.initStatus();
			}
		}

		public static function save ():void {
			_save.data.levelsStatus = Service.cloneObject(LevelData.status);
			_save.data.indexComment = Failure.index;
			_save.flush();
		}
		
	}

}