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
		private static var comic:Font = new Comic;
		private static var ken:Font = new Ken;
		
		// --- Format
		public static var buttonLevel:TextFormat = new TextFormat (shark.fontName, 25, 0x666053, false, false, false, null, null, TextFormatAlign.CENTER);
		public static var failComment:TextFormat = new TextFormat (ken.fontName, 20, 0xFFFFFF, false, false, false, null, null, TextFormatAlign.CENTER);
	}
	
}