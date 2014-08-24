package system {
	
	import com.soulgame.utils.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class LevelData {
		
		public static const DATA:Array = []
		private static var _status:Array = [null];
		
		/* PLANET : 
			size : 2=medium, 1=small
			originX
			originY
			direction : 0=no roation, 1=clock, 2=anti clock
		*/
		public static function init() {
			var lvl:int;
			
			lvl = 0;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 400, 300, 0];
			DATA[lvl][1] 	= [1, 300, 380, 1];
			
			lvl = 1;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 400, 300, 0];
			DATA[lvl][1] 	= [1, 300, 380, 1];
			DATA[lvl][2] 	= [2, 500, 380, 1];
			
			lvl = 2;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 200, 300, 0];
			DATA[lvl][1] 	= [1, 150, 380, 1];
			DATA[lvl][2] 	= [1, 560, 120, -1];
			DATA[lvl][3] 	= [2, 400, 420, 0];
			
			lvl = 3;
			DATA[lvl] 		= [];
			DATA[lvl][0]	= [2, 400, 300, 0];
			DATA[lvl][1] 	= [1, 150, 380, 1];
			DATA[lvl][2] 	= [2, 400, 420, 0];
			
			lvl = 4;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 380, 100];
			DATA[lvl][1] 	= [1, 350, 380];
			DATA[lvl][2] 	= [1, 160, 520];
			DATA[lvl][3] 	= [2, 220, 150];
			DATA[lvl][4] 	= [1, 700, 220];
			DATA[lvl][5] 	= [2, 280, 400];
			DATA[lvl][6] 	= [2, 200, 300];
			DATA[lvl][7] 	= [1, 420, 450];
			DATA[lvl][8] 	= [2, 500, 162];
			
			lvl = 5;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 305, 245];
			DATA[lvl][1] 	= [2, 495, 245];
			DATA[lvl][2] 	= [2, 400, 410];
			DATA[lvl][3] 	= [1, 210, 190];
			DATA[lvl][4] 	= [1, 590, 190];
			DATA[lvl][5] 	= [1, 400, 520];
			
			
		}
		
		public static function initStatus ():void {
			for (var i:int = 0; i < nbLevels; i ++) {
				_status[i] = 1;
			}
			_status[0] = 2;
		}
		
		public static function setStatus (pStatusId:int, pValue:int):void {
			if (_status[pStatusId] && _status[pStatusId] < pValue) {
				_status[pStatusId] = pValue;
			}
		}
		
		
		// GETTERS / SETTERS
		static public function get nbLevels():int {
			return (DATA.length - 1);
		}
		static public function get status():Array {
			return _status;
		}
		static public function set status(p:Array):void {
			_status = p;
		}
	
	}

}