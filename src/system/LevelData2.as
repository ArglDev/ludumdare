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
		*/
		public static function init() {
			var lvl:int;
			
			lvl = 0;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 400, 300];
			DATA[lvl][1] 	= [1, 300, 380, 1];
			
			lvl = 1;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 280, 225, 0];
			DATA[lvl][1] 	= [1, 71, 90, 1];
			DATA[lvl][2] 	= [2, 466, 386, 0];
			DATA[lvl][3] 	= [1, 685, 520, 1];
			
			lvl = 2;
			DATA[lvl] 		= [];
			DATA[lvl][0]	 = [2, 515, 193, 0];
			DATA[lvl][1] 	= [1, 139, 299, 1];
			DATA[lvl][2] 	= [2, 269, 396, 0];
			DATA[lvl][3] 	= [1, 389, 300, -1];
			DATA[lvl][4] 	= [1, 639, 301, -1];
	
			
			lvl = 3;
			
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 565, 295, 0];
			DATA[lvl][1] 	= [1, 131, 397, -1];
			DATA[lvl][2]	 = [2, 213, 297, 0];
			DATA[lvl][3] 	= [1, 645, 392, 1];
			DATA[lvl][4] 	= [1, 325, 225, 1];
			DATA[lvl][5] 	= [1, 458, 225, -1];
			DATA[lvl][6] 	= [2, 391, 297, 0];
			
			lvl = 4;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 312, 411, 0];
			DATA[lvl][1] 	= [1, 400, 408, -1];
			DATA[lvl][2] 	= [2, 484, 411, 0];
			DATA[lvl][3] 	= [1, 245, 343, -1];
			DATA[lvl][4] 	= [1, 554, 344, 1];
			DATA[lvl][5] 	= [1, 403, 174, -1];
			
			lvl = 5;
			DATA[lvl] 		= [];
			DATA[lvl][0] = [2, 316, 239, 0];
			DATA[lvl][1] = [1, 379, 434, 1];
			DATA[lvl][2] = [2, 380, 343, 0];
			DATA[lvl][3] = [2, 439, 237, 0];
			DATA[lvl][4] = [1, 242, 189, -1];
			DATA[lvl][5] = [1, 504, 184, -1];
			
			lvl = 6;
			DATA[lvl] 		= [];
			DATA[lvl][0] = [2, 504, 206, 0];
			DATA[lvl][1] = [1, 369, 214, -1];
			DATA[lvl][2] = [2, 680, 70, 0];
			DATA[lvl][3] = [1, 637, 183, 1];
			DATA[lvl][4] = [2, 124, 495, 0];
			DATA[lvl][5] = [2, 312, 353, 0];
			DATA[lvl][6] = [1, 553, 84, -1];
			DATA[lvl][7] = [1, 454, 334, 1];
			DATA[lvl][8] = [1, 179, 363, -1];
			DATA[lvl][9] = [1, 270, 477, 1];
			
			lvl = 7;
			DATA[lvl] 		= [];
			DATA[lvl][0] = [2, 250, 150, 0];
			DATA[lvl][1] = [2, 250, 450, 0];
			DATA[lvl][2] = [2, 550, 150, 0];
			DATA[lvl][3] = [2, 550, 450, 0];
			DATA[lvl][4] = [1, 400, 299, 1];
			DATA[lvl][5] = [1, 682, 295, -1];
			DATA[lvl][6] = [1, 98, 311, 1];
			DATA[lvl][7] = [1, 250, 303, -1];
			DATA[lvl][8] = [1, 551, 295, -1];
			
			lvl = 8;
			DATA[lvl] 		= [];
			DATA[lvl][0] = [2, 300, 247, 0];
			DATA[lvl][1] = [1, 541, 177, -1];
			DATA[lvl][2] = [2, 360, 347, 0];
			DATA[lvl][3] = [2, 417, 247, 0];
			DATA[lvl][4] = [1, 182, 178, -1];
			DATA[lvl][5] = [1, 362, 467, -1];
			DATA[lvl][6] = [1, 363, 570, 1];
			DATA[lvl][7] = [1, 646, 112, 1];
			DATA[lvl][8] = [1, 90, 111, 1];
			DATA[lvl][9] = [1, 215, 366, -1];
			DATA[lvl][10] = [1, 502, 365, -1];
			DATA[lvl][11] = [1, 359, 125, -1];
			
			lvl = 9;
			DATA[lvl]		= [];
			DATA[lvl][0] = [2, 424, 304, 0];
			DATA[lvl][1] = [1, 241, 308, 1];
			DATA[lvl][2] = [2, 317, 304, 0];
			DATA[lvl][3] = [2, 531, 305, 0];
			DATA[lvl][4] = [1, 608, 303, -1];
			
			
			lvl = 10;
			DATA[lvl]		= [];
			DATA[lvl][0] = [2, 296, 342, 0];
			DATA[lvl][1] = [1, 399, 289, -1];
			DATA[lvl][2] = [2, 500, 342, 0];
			DATA[lvl][3] = [1, 588, 294, -1];
			DATA[lvl][4] = [1, 395, 395, 1];
			DATA[lvl][5] = [1, 212, 284, 1];
			
			lvl = 11;
			DATA[lvl]		= [];
			DATA[lvl][0] = [2, 255, 301, 0];
			DATA[lvl][1] = [1, 431, 100, 1];
			DATA[lvl][2] = [2, 367, 170, 0];
			DATA[lvl][3] = [2, 169, 224, 0];
			DATA[lvl][4] = [2, 337, 377, 0];
			DATA[lvl][5] = [1, 85, 147, -1];
			DATA[lvl][6] = [1, 428, 461, 1];
			DATA[lvl][7] = [1, 306, 237, -1];
			
			lvl = 12;
			DATA[lvl]		= [];
			DATA[lvl][0] = [2, 400, 400, 0];
			DATA[lvl][1] = [2, 100, 100, 0];
			DATA[lvl][2] = [2, 612, 312, 0];
			DATA[lvl][3] = [2, 188, 312, 0];
			DATA[lvl][4] = [1, 400, 99, 1];
			DATA[lvl][5] = [1, 515, 377, 1];
			DATA[lvl][6] = [1, 285, 377, 1];
			DATA[lvl][7] = [1, 123, 215, 1];
			DATA[lvl][8] = [1, 400, 500, 1];
			DATA[lvl][9] = [1, 117, 383, 1];
			
			
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