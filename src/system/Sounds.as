package system {
	
	import com.soulgame.sounds.*;
	import com.soulgame.utils.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class Sounds {
		
		public static var buttonClick:SoundMax 		= new ButtonClick;
		public static var buttonOver:SoundMax 		= new ButtonOver;
		public static var bip:SoundMax 				= new Bip;
		public static var boing:SoundMax 			= new Boing;
		public static var downUp:SoundMax 			= new DownUp;
		public static var explode:SoundMax 			= new Explode;
		public static var highDown:SoundMax 		= new HighDown;
		public static var pop:SoundMax 				= new Pop;
		public static var explo1:SoundMax 			= new Explo1;
		public static var explo2:SoundMax 			= new Explo2;
		public static var explo3:SoundMax 			= new Explo3;
		public static var explo4:SoundMax 			= new Explo4;
		public static var explo5:SoundMax 			= new Explo5;
		public static var clickPlanet:SoundMax 		= new ClickPlanet;
		public static var linkPlanet:SoundMax 		= new LinkPlanet;
		public static var typeLetter:SoundMax 		= new TypeLetter;
		
		private static var _explosions:Array = [explo1, explo2, explo3, explo4, explo5];
		
		public static function readExplode (pVolume):void {
			SoundMax(_explosions[Maths.randInt(4)]).read(pVolume);
		}
	
	}

}