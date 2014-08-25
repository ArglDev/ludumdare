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
			direction : 0=none, -1=clock, 1=anti clock
			skins : (type 1 >> 0-4) (type 2 >> 0-7) 
		*/
		public static function init() {
			var lvl:int;
			var decay:int;
			
			lvl = 0;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 400, 300];
			DATA[lvl][1] 	= [1, 300, 380, 1];
			
			lvl = 1;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 400, 300];
			DATA[lvl][1] 	= [1, 300, 380, 1];
			DATA[lvl][2] 	= [2, 500, 380, 1];
			
			lvl = 2;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 200, 300];
			DATA[lvl][1] 	= [1, 150, 380, 1];
			DATA[lvl][2] 	= [1, 560, 120, -1];
			DATA[lvl][3] 	= [2, 400, 420];
			
			lvl = 3;
			DATA[lvl] 		= [];
			DATA[lvl][0]	= [2, 400, 300];
			DATA[lvl][1] 	= [1, 150, 380, 1];
			DATA[lvl][2] 	= [2, 400, 420];
			
			lvl = 4;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 380, 100];
			DATA[lvl][1] 	= [1, 350, 380, -1];
			DATA[lvl][2] 	= [1, 160, 520, 1];
			DATA[lvl][3] 	= [2, 220, 150];
			DATA[lvl][4] 	= [1, 700, 220, -1];
			DATA[lvl][5] 	= [2, 280, 400];
			DATA[lvl][6] 	= [1, 420, 450, 1];
			DATA[lvl][7] 	= [2, 500, 162];
			
			lvl = 5;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 305, 245];
			DATA[lvl][1] 	= [2, 495, 245];
			DATA[lvl][2] 	= [2, 400, 410];
			DATA[lvl][3] 	= [1, 210, 190, -1];
			DATA[lvl][4] 	= [1, 590, 190, -1];
			DATA[lvl][5] 	= [1, 400, 520, -1];
			
			// ============================================================
			// ARGL
			// ============================================================
			lvl = 6;
			decay = 40;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 409, 310+decay, 0];
			DATA[lvl][1] 	= [1, 705, 516+decay, 1];
			DATA[lvl][2] 	= [2, 189, 137+decay, 0];
			DATA[lvl][3] 	= [2, 51, 61+decay, 0];
			DATA[lvl][4] 	= [1, 243, 75+decay, -1];
			DATA[lvl][5] 	= [2, 781, 7+decay, 0];
			DATA[lvl][6] 	= [1, 260, 196+decay, 1];
			
			lvl = 7;
			decay = 50;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 299+decay, 472, 0];
			DATA[lvl][1] 	= [1, 64+decay, 500, 1];
			DATA[lvl][2] 	= [2, 451+decay, 425, 0];
			DATA[lvl][3] 	= [2, 574+decay, 324, 0];
			DATA[lvl][4] 	= [2, 634+decay, 227, 0];
			DATA[lvl][5] 	= [1, 374+decay, 445, 1];
			DATA[lvl][6] 	= [1, 481+decay, 118, 1];
			DATA[lvl][7] 	= [2, 105+decay, 151, 0];
			DATA[lvl][8] 	= [2, 25+decay, 191, 0];
			DATA[lvl][9] 	= [2, 270+decay, 355, 0];
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
			return DATA.length;
		}
		static public function get status():Array {
			return _status;
		}
		static public function set status(p:Array):void {
			_status = p;
		}
	
	}

}