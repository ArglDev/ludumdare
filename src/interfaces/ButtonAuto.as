﻿package interfaces {
	
	import com.soulgame.interfaces.*;
	import com.soulgame.system.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;
	import game.*;
	
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
			
			if (e.currentTarget is ButtonHome) {
				Menu.openTitle();
			}
			
			if (e.currentTarget is ButtonBuild) {
				Main.game.switchBuild();
			}
			
			if (e.currentTarget is ButtonReset) {
				Main.game.resetLevel();
			}
			
			if (e.currentTarget is ButtonTest) {
				Main.game.switchTest();
			}
			
			if (e.currentTarget is ButtonHome) {
				Menu.openTitle();
			}
		}
		
	}

}