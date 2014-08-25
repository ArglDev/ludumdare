package interfaces {
	
	import com.soulgame.interfaces.*;
	import com.soulgame.system.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;
	import game.*;
	import system.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	
	public class ButtonAuto extends ButtonCore {
		
		// METHODS
		override protected function _click(e:MouseEvent):void {
			super._click(e);
			
			if (e.currentTarget is ButtonPlay || e.currentTarget is ButtonLevelSelect) {
				Menu.openLevelSelect();
			}
			
			if (e.currentTarget is ButtonBuild) {
				Main.game.buildLevel();
			}
			
			if (e.currentTarget is ButtonRestart) {
				Main.game.startLevel(Main.game.currentLevel);
			}
			
			if (e.currentTarget is ButtonTest && !LevelEditor.inEditor) {
				Main.game.testLevel();
			}
			
			if (e.currentTarget is ButtonNext) {
				Main.game.startLevel(Main.game.currentLevel+1);
			}
			
			if (e.currentTarget is ButtonHome) {
				Menu.openTitle();
			}
			
			if (e.currentTarget is ButtonCredits) {
				Menu.openCredits();
			}
			
			if (e.currentTarget is ButtonClearData) {
				if (currentFrame == 2) {
					Menu.clearData();
					gotoAndStop(1);
				} else {
					gotoAndStop(2);
				}
			}

		}
		
	}

}