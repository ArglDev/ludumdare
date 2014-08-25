package interfaces {
	
	import com.soulgame.interfaces.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class Screens {
		
		public static var credits:Screen 		= new ScreenCredits;
		public static var levelSelect:Screen 	= new ScreenLevelSelect;
		public static var gameButtons:Screen 	= new ScreenGameButtons;
		public static var topButtons:Screen 	= new ScreenTopButtons;
		public static var title:Screen 			= new ScreenTitle;
		
		public static function init ():void {
			credits 		= new ScreenCredits;
			levelSelect 	= new ScreenLevelSelect;
			gameButtons 	= new ScreenGameButtons;
			topButtons 		= new ScreenTopButtons;
			title 			= new ScreenTitle;
		}
	
	}

}