package game {
	
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class LinkManager {
		
		// PROPERTIES
		private static var _clickedPlanet:Planet;
		
		
		// METHODS
		private static function _click (e:MouseEvent):void {
		}
		
		private static function _manage (e:Event):void {
			
		}
		
		private static function _release (e:MouseEvent):void {
			
		}
		
		public static function start ():void {
			Global.stage.addEventListener(MouseEvent.MOUSE_DOWN, _click);
			Global.stage.addEventListener(MouseEvent.MOUSE_UP, _release);
		}
		
		
		public static function stop ():void {
			Global.stage.removeEventListener(MouseEvent.MOUSE_DOWN, _click);
			Global.stage.removeEventListener(MouseEvent.MOUSE_UP, _release);
		}
		
		// GETTERS
		static public function get clickedPlanet():Planet {
			return _clickedPlanet;
		}
		
		
		// SETTERS
		static public function set clickedPlanet(p:Planet):void {
			_clickedPlanet = p;
		}
	
	}

}