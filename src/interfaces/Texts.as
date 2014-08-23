package interfaces {
	
	import flash.events.*;
	import flash.text.*;
	import com.soulgame.system.*;
	import com.soulgame.effects.Colors;
	import system.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	
	public class Texts {
		
		
		// PROPERTIES
		// --- Fonts
		private static var shark:Font = new Shark;
		
		// --- Format
		public static var buttonLevel:TextFormat = new TextFormat (shark.fontName, 25, 0x666053, false, false, false, null, null, TextFormatAlign.CENTER);
	}
	
}