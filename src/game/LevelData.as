package game {
	
	/**
	 * ...
	 * @author Argl
	 */
	public class LevelData {
		
		public static const DATA:Array = []
		
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
		}
	
	}

}