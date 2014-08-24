package system {
	
	import flash.net.*;
	import flash.events.*;
	import system.*;
	import src.characters.*;
	import src.interfaces.*;
	import src.*;
	import src.game.*;
	import utils.*;
	import interfaces.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	
	public class SaveManager {
		
		// PROPERTIES
		private static var _save:SharedObject 	= SharedObject.getLocal('ludargl4102/save');

		
		
		// METHODS
		public static function clear():void {
			// --- Clear

			// --- Init
			
			// --- Save clearing
			save();
		}

		
		public static function load ():void {
			if (_levels.data.challengesStatus != undefined) {
				ChallengesStats.status = Service.cloneObject(_levels.data.challengesStatus);
				ChallengesStats.stars = Service.cloneObject(_levels.data.challengesStars);
			} else {
				ChallengesStats.init();
			}
			ChallengesStats.updateTemp();
		}

		

		public static function save ():void {
			_levels.data.zonePerfect 			= Service.cloneObject(ZonesStats.perfect);
			_levels.data.zoneMissions 			= Service.cloneObject(ZonesStats.missions);
			_levels.data.zonePrisoners			= Service.cloneObject(ZonesStats.prisoners);
			_levels.data.zoneStatus 			= Service.cloneObject(ZonesStats.status);
			_levels.flush();
		}
		
	}

}