package game {
	
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
			// LEVEL 0
			DATA[0] = [];
			DATA[0][0] = [2, 200, 300, 0];
			DATA[0][1] = [1, 150, 380, 1];
			DATA[0][2] = [1, 560, 120, -1];
			DATA[0][3] = [2, 400, 420, 0];
						
			// LEVEL 1
			DATA[1] = [];
			DATA[1][0] = [2, 280, 100];
			DATA[1][1] = [1, 350, 380];
			DATA[1][2] = [1, 160, 520];
			DATA[1][3] = [2, 700, 220];
			
			// LEVEL 1
			DATA[2] = [];
			DATA[2][0] = [2, 380, 100];
			DATA[2][1] = [1, 350, 380];
			DATA[2][2] = [1, 160, 520];
			DATA[2][3] = [2, 220, 150];
			DATA[2][4] = [1, 700, 220];
			DATA[2][5] = [2, 280, 400];
			DATA[2][6] = [2, 200, 300];
			DATA[2][7] = [1, 420, 450];
			DATA[2][8] = [2, 500, 162];
		}
		
		public static function initStatus ():void {
			for (var i:int = 0; i < DATA.length - 1; i ++) {
				_status[i + 1] = 1;
			}
			_status[1] = 2;
		}
		
		public static function setStatus (pStatusId:int, pValue:int):void {
			if (_status[pStatusId] < pValue) {
				_status[pStatusId] = pValue;
			}
		}
		
		
		// GETTERS / SETTERS
		static public function get status():Array {
			return _status;
		}
		
		static public function set status(p:Array):void {
			_status = p;
		}
	
	}

}