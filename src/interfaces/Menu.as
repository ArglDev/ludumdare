package interfaces {
	
	/**
	 * ...
	 * @author Argl
	 */
	public class Menu {
		
		public static function init ():void {
			Screens.levelSelect.hide();
			
			Screens.topButtons.show();
			Screens.title.show();
			Screens.title.fadeIn(1.5, 0.1);
		}
		
		public static function openLevelSelect ():void {
			Screens.levelSelect.show();
			Screens.levelSelect.slide(0, 300);
		}
	
	}

}