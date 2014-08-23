package interfaces {
	
	import com.soulgame.interfaces.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class Screens {
		
		public static var levelComplete:Screen 	= new ScreenLevelComplete;
		public static var levelFailed:Screen 	= new ScreenLevelFailed;
		public static var levelSelect:Screen 	= new ScreenLevelSelect;
		public static var topButtons:Screen 	= new ScreenTopButtons;
		public static var title:Screen 			= new ScreenTitle;
	
	}

}