package system 
{
	/**
	 * ...
	 * @author Argl
	 */
	public class LevelData {
		
		
		
		public static function initStatus ():void {
			for (var i:int = 0; i < LevelManager.LEVELS.length - 1; i ++) {
				_status[i + 1] = 1;
			}
			_status[1] = 2;
			_status[51] = 2;
		}
		
	}

}