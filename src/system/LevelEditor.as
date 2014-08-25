package system {
	
	import com.soulgame.effects.*;
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import game.*;
	import system.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class LevelEditor {
		
		// PROPERTIES
		private static var _inEditor:Boolean;
		
		
		// METHODS
		public static function activate ():void {
			Global.stage.addEventListener(KeyboardEvent.KEY_DOWN, _press);	
		}
		
		public static function deactivate ():void {
			Global.stage.removeEventListener(KeyboardEvent.KEY_DOWN, _press);
		}
		
		private static function _click (e:MouseEvent):void {
			// --- Reset filter of previous selected planet (if any)
			if (LinkManager.clickedPlanet != null) {
				LinkManager.clickedPlanet.filters = [];
			}
			
			// --- Define and drag new the clicked planet
			LinkManager.clickedPlanet = LinkManager.getPlanetFocused();
			if (LinkManager.clickedPlanet != null) {
				LinkManager.clickedPlanet.filters = [Filters.outline(2, 2, 0xFFFFFF)];
				LinkManager.clickedPlanet.startDrag(false);
			}
		}

		private static function _press (e:KeyboardEvent) {
			var currPlanet:Planet = LinkManager.clickedPlanet;
			
			if (Main.game.isBuilding) {
				// MODE EDITOR IN/OUT
				if (e.keyCode == Keys.space) {
					if (_inEditor) {
						LinkManager.reset();
						reset();
					} else {
						LinkManager.removeLinks();
						Main.game.background1.gotoAndStop(3)
						LinkManager.stop();
						Global.stage.addEventListener(MouseEvent.MOUSE_DOWN, _click);
						Global.stage.addEventListener(MouseEvent.MOUSE_UP, _release);
						_inEditor = true; 
					}
				}
				
				// CHECK KEYS
				if (_inEditor) {
					// --- Direction
					if (currPlanet != null && currPlanet.isSmall) {
						if (e.keyCode == Keys.right) {
							currPlanet.setDirectionEditor( -1);
						} else if (e.keyCode == Keys.left) {
							currPlanet.setDirectionEditor(1);
						}
					}
					
					// --- Add planets
					if (e.keyCode == Keys.one || e.keyCode == Keys.two) {
						var planet:Planet = new Planet(e.keyCode == Keys.one? 1 : 2, Maths.rand(800), Maths.rand(600), e.keyCode == Keys.one? -1 : 0);
						Main.game.planets.addChild(planet);
					}
					
					// --- Remove
					if (e.keyCode == Keys.del && currPlanet != null ) {
						Main.game.planets.removeChild(currPlanet);
						_removePlanetFromList(Planet.list, currPlanet);
					}
				}
				
				// TRACE LEVEL DATA
				if (e.keyCode == Keys.enter) {
					var lvl:int = Main.game.currentLevel;
					trace('\r================ LEVEL ' + lvl + ' DATA ==================');
					for (var i:int = 0; i < Main.game.planets.numChildren ; i++) {
						trace('DATA[lvl][' + i + '] = ' + Planet(Main.game.planets.getChildAt(i)).getEditorData() + ';');
					}
					trace('============================================================');
				}
			}
		}
		
		private static function _removePlanetFromList(pArray:Array, pPlanet:Planet):void {
			var len:uint = pArray.length;
			for (var i:Number = len; i > -1; i--) {
				if(pArray[i] === pPlanet){
					pArray.splice(i, 1);
				}
			}					
		}
		
		private static function _release (e:MouseEvent):void {
			var currPlanet:Planet = LinkManager.clickedPlanet;
			
			if (currPlanet != null) {
				currPlanet.stopDrag();
				currPlanet.setCoordEditor(currPlanet.x, currPlanet.y);
			}
		}
		
		private static function _removeAllLinks ():void {
			for (var i:int = 0; i < Planet.list.length; i++) {
				Planet(Planet.list[i]).link = null;
			}
		}
		
		public static function reset ():void {
			if (LinkManager.clickedPlanet) {
				LinkManager.clickedPlanet.filters = [];
			}
			Main.game.background1.gotoAndStop(1)
			_inEditor = false; 
			_removeAllLinks();
			Global.stage.removeEventListener(MouseEvent.MOUSE_DOWN, _click);
			Global.stage.removeEventListener(MouseEvent.MOUSE_UP, _release);
		}
		
		
		// GETTERS
		static public function get inEditor():Boolean{
			return _inEditor;
		}
	}

}