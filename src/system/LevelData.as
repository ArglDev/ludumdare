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
			skins : (type1 => 0-4) (type2 => 0-7) 
		*/
		public static function init() {
			var lvl:int;
			var decX:int;
			var decY:int;

			// 1 TUTO : control
			lvl = 0;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 400, 300, 0, 2];
			DATA[lvl][1] 	= [1, 300, 380, 1, 5];
			
			// 2 TUTO : small + 1 link
			lvl ++;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 300, 350, 0];
			DATA[lvl][1] 	= [1, 100, 370, 1];
			DATA[lvl][2] 	= [2, 500, 370, 0];
			DATA[lvl][3] 	= [1, 700, 350, 1];
			
			// 3 TUTO : big = multi link
			lvl ++;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 200, 300];
			DATA[lvl][1] 	= [1, 150, 380, 1];
			DATA[lvl][2] 	= [1, 560, 120, -1];
			DATA[lvl][3] 	= [2, 400, 420];
			
			// 4 TUTO : direction
			lvl ++;
			DATA[lvl] 		= [];
			DATA[lvl][0]	= [2, 515, 193, 0];
			DATA[lvl][1] 	= [1, 139, 299, 1];
			DATA[lvl][2] 	= [2, 269, 396, 0];
			DATA[lvl][3] 	= [1, 389, 300, -1];
			DATA[lvl][4] 	= [1, 639, 301, -1];

			lvl ++
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 316, 239, 0];
			DATA[lvl][1] 	= [1, 379, 434, -1];
			DATA[lvl][2] 	= [2, 380, 343, 0];
			DATA[lvl][3] 	= [2, 439, 237, 0];
			DATA[lvl][4] 	= [1, 242, 189, -1];
			DATA[lvl][5] 	= [1, 504, 184, -1];
			
			lvl ++;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 250, 150, 0];
			DATA[lvl][1] 	= [2, 250, 450, 0];
			DATA[lvl][2] 	= [2, 550, 150, 0];
			DATA[lvl][3] 	= [2, 550, 450, 0];
			DATA[lvl][4] 	= [1, 400, 299, 1];
			DATA[lvl][5] 	= [1, 682, 295, -1];
			DATA[lvl][6] 	= [1, 98, 311, 1];
			DATA[lvl][7] 	= [1, 250, 303, -1];
			DATA[lvl][8] 	= [1, 551, 295, -1];
			
			lvl ++;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 565, 295, 0];
			DATA[lvl][1] 	= [1, 131, 397, -1];
			DATA[lvl][2]	= [2, 213, 297, 0];
			DATA[lvl][3] 	= [1, 645, 392, 1];
			DATA[lvl][4] 	= [1, 325, 225, 1];
			DATA[lvl][5] 	= [1, 458, 225, -1];
			DATA[lvl][6] 	= [2, 391, 297, 0];
			
			lvl ++;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 504, 206, 0];
			DATA[lvl][1] 	= [1, 369, 214, -1];
			DATA[lvl][2] 	= [2, 680, 70, 0];
			DATA[lvl][3] 	= [1, 637, 183, 1];
			DATA[lvl][4] 	= [2, 124, 495, 0];
			DATA[lvl][5] 	= [2, 312, 353, 0];
			DATA[lvl][6] 	= [1, 553, 84, -1];
			DATA[lvl][7] 	= [1, 454, 334, 1];
			DATA[lvl][8] 	= [1, 179, 363, -1];
			DATA[lvl][9] 	= [1, 270, 477, 1];
			
			lvl ++;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 349, 472, 0, 5];
			DATA[lvl][1] 	= [1, 114, 500, -1];
			DATA[lvl][2] 	= [2, 501, 425, 0, 5];
			DATA[lvl][3] 	= [2, 624, 324, 0, 5];
			DATA[lvl][4] 	= [2, 684, 227, 0, 5];
			DATA[lvl][5] 	= [1, 424, 445, 1];
			DATA[lvl][6] 	= [1, 531, 118, 1];
			DATA[lvl][7] 	= [2, 175, 135, 0, 5];
			DATA[lvl][8] 	= [2, 78, 196, 0, 5];
			DATA[lvl][9] 	= [2, 320, 355, 0, 5];
			
			// 10
			lvl ++;
			decX = 0;
			decY = 0;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 312, 411, 0];
			DATA[lvl][1] 	= [1, 400, 408, -1];
			DATA[lvl][2] 	= [2, 484, 411, 0];
			DATA[lvl][3] 	= [1, 245, 343, -1];
			DATA[lvl][4] 	= [1, 554, 344, 1];
			DATA[lvl][5] 	= [1, 403, 174, -1];
			
			lvl ++;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 409+decX, 310+decY, 0];
			DATA[lvl][1] 	= [1, 705+decX, 516+decY, 1];
			DATA[lvl][2] 	= [2, 189+decX, 137+decY, 0];
			DATA[lvl][3] 	= [2, 51+decX, 61+decY, 0];
			DATA[lvl][4] 	= [1, 243+decX, 75+decY, -1];
			DATA[lvl][5] 	= [2, 781+decX, 7+decY, 0];
			DATA[lvl][6] 	= [1, 260 + decX, 196 + decY, 1];
			
			
			// NEW ===========================================================
			// 12
			lvl ++;
			DATA[lvl]		= [];
			DATA[lvl][0] 	= [2, 296, 342, 0];
			DATA[lvl][1] 	= [1, 399, 289, -1];
			DATA[lvl][2] 	= [2, 500, 342, 0];
			DATA[lvl][3] 	= [1, 588, 294, -1];
			DATA[lvl][4] 	= [1, 395, 395, 1];
			DATA[lvl][5] 	= [1, 212, 284, 1];
			
			lvl ++;
			DATA[lvl]		= [];
			DATA[lvl][0] 	= [2, 255, 301, 0];
			DATA[lvl][1] 	= [1, 431, 100, 1];
			DATA[lvl][2] 	= [2, 367, 170, 0];
			DATA[lvl][3] 	= [2, 169, 224, 0];
			DATA[lvl][4] 	= [2, 337, 377, 0];
			DATA[lvl][5] 	= [1, 85, 147, -1];
			DATA[lvl][6] 	= [1, 428, 461, 1];
			DATA[lvl][7] 	= [1, 306, 237, -1];
			
			lvl ++;
			decX = 50;
			decY = 30;
			DATA[lvl]		= [];
			DATA[lvl][0] 	= [2, 400 + decX, 400 + decY, 0];
			DATA[lvl][1] 	= [2, 100 + decX, 100 + decY, 0];
			DATA[lvl][2] 	= [2, 612 + decX, 312 + decY, 0];
			DATA[lvl][3] 	= [2, 188 + decX, 312 + decY, 0];
			DATA[lvl][4] 	= [1, 400 + decX, 099 + decY, 1];
			DATA[lvl][5] 	= [1, 515 + decX, 377 + decY, 1];
			DATA[lvl][6] 	= [1, 285 + decX, 377 + decY, 1];
			DATA[lvl][7] 	= [1, 123 + decX, 215 + decY, 1];
			DATA[lvl][8] 	= [1, 400 + decX, 500 + decY, 1];
			DATA[lvl][9] 	= [1, 117 + decX, 383 + decY, 1];
			
			lvl ++;
			DATA[lvl] 		= [];
			DATA[lvl][0] 	= [2, 300, 247, 0];
			DATA[lvl][1] 	= [1, 541, 177, -1];
			DATA[lvl][2]	= [2, 360, 347, 0];
			DATA[lvl][3]	= [2, 417, 247, 0];
			DATA[lvl][4]	= [1, 182, 178, -1];
			DATA[lvl][5]	= [1, 362, 467, -1];
			DATA[lvl][6]	= [1, 363, 570, 1];
			DATA[lvl][7]	= [1, 646, 112, 1];
			DATA[lvl][8]	= [1, 90, 111, 1];
			DATA[lvl][9]	= [1, 215, 366, -1];
			DATA[lvl][10]	= [1, 502, 365, -1];
			DATA[lvl][11]	= [1, 359, 125, -1];
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
		
		public static function unlockAll ():void {
			for (var i:int = 0; i < nbLevels; i ++) {
				setStatus(i, 2);
			}
			SaveManager.save();
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