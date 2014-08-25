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
		private static var ken:Font = new Ken;
		
		// --- Format
		public static var buttonLevel:TextFormat 	= new TextFormat (ken.fontName, 18, 0x36332C, false, false, false, null, null, TextFormatAlign.CENTER);
		public static var failText:TextFormat 		= new TextFormat (ken.fontName, 20, 0xFFFFFF, false, false, false, null, null, TextFormatAlign.CENTER);
		public static var winText:TextFormat 		= new TextFormat (ken.fontName, 30, 0xFFFFFF, false, false, false, null, null, TextFormatAlign.CENTER);
	}
	
}