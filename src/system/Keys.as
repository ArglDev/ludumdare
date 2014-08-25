 package system {
	
	import com.soulgame.system.*;
	import game.*;
	import system.*;

	/**
	 * ...
	 * @author Argl
	 */
	public class Keys {
		
		// TODO - gérer une classe Keys commune à tous les jeux qui gère automatiquement un jeu de touches défini eu sein de chaque jeu
		
		// PROPERTIES
		// --- Keys codes
		static public const pause:int 			= 80; // P
		static public const escp:int 			= 27; // ESCP
		static public const enter:int 			= 13; // ENTER
		static public const space:int 			= 32; // ESPACE
		static public const right:int 			= 39; // RIGHT
		static public const left:int 			= 37; // LEFT
		static public const down:int 			= 40; // DOWN
		static public const zero:int 			= 96; // 0
		static public const one:int 			= 97; // 1
		static public const two:int 			= 98; // 2
		static public const del:int 			= 46; // SUPPR
		// --- Keys hold
		static public var rightHold:Boolean		= false;
		static public var leftHold:Boolean		= false;
		static public var upHold:Boolean		= false;
		static public var downHold:Boolean		= false;
		static public var pauseHold:Boolean 	= false;
		static public var spaceHold:Boolean 	= false;
		static public var enterHold:Boolean 	= false;

		
		// METHODS
		
		static public function enable ():void {
		}
		
		static public function disable ():void {

		}
		
	}
}