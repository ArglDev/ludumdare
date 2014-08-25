package interfaces {
	
	import com.greensock.*;
	import com.soulgame.effects.*;
	import com.soulgame.interfaces.*;
	import com.soulgame.sounds.*;
	import com.soulgame.system.*;
	import com.soulgame.utils.*;
	import flash.display.*;
	import flash.events.*;
	import system.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class Menu {
		
		// PROPERTIES
		
		
		
		// METHODS
		public static function clearData ():void {
			SaveManager.clear();
			Sounds.highDown.read(1.1);
		}
		
		private static function _clickLevel (e:MouseEvent):void {
			Main.game.startLevel(ButtonMax(e.currentTarget).id);
		}
		
		public static function createMultiFirework ():void {
			var delay:int = 10;
/*			TweenMax.delayedCall(delay + 00, createFirework, [Screens.levelComplete, 0, -100], true);
			TweenMax.delayedCall(delay + 45, createFirework, [Screens.levelComplete, -150, 48], true);
			TweenMax.delayedCall(delay + 60, createFirework, [Screens.levelComplete, 220, 120], true);
			TweenMax.delayedCall(delay + 65, createFirework, [Screens.levelComplete, 30, 0], true);*/
		}
		
		public static function createFirework (pContainer:DisplayObjectContainer, pX:Number = 0, pY:Number = 0):void {
			Effects.particle(Star2Particle, 20, pContainer, pX, pY, 15, 65, 2, true, false, 0.6, -1, 0, -1);
			Effects.particle(FireParticle, 20, pContainer, pX, pY, 18, 60, 1.5, false, false, 0.9, -1, 0, -1);
			Sounds.fall.read(0.06, 400);
			Sounds.teleport.read(0.45);
			Sounds.explode.read(0.2, 50);
		}
		
		public static function createParticles (pContainer:DisplayObjectContainer, pX:Number = 0, pY:Number = 0, pNb:int = 20, pScale:Number = 1.3, pSound:SoundMax = null):void {
			Effects.particle(ShineParticle, pNb, pContainer, pX, pY, 4.5, 35, pScale, false, false, 0.2, -1, 0, -1);
			if (pSound) {
				pSound.read(0.7);
			}
		}
		
		public static function init ():void {
			openTitle();
			
			// Level select buttons
			var button:ButtonMax;
			for (var i:int = 0; i < LevelData.nbLevels; i ++) {
				var l:int = i / 10;
				var c:int = i % 10;
				button = new ButtonMax (ButtonLevel, Screens.levelSelect, String(i + 1), 154 + 55 * c, 220 + 55 * l, _clickLevel, Texts.buttonLevel);
				button.id = i;
				button.disabledAlpha = 0.35;
			}
		}

		public static function openCredits ():void {
			Screens.credits.show(Global.stage, 0, 0, true, 0.7);
			Screens.credits.slide(0, 300);
		}
		
		public static function openLevelSelect ():void {
			Screens.levelSelect.show(Global.stage, 0, 0, true, 0.7);
			Screens.levelSelect.slide(0, 300);
			updateLevelButtons();
		}
		
		public static function openTitle ():void {
			Main.game.stopLevel();
			Screens.title.buttonClear.gotoAndStop(1);
			Screens.title.show();
			Screens.title.slide(0, 40, 0.15, 0, 1.2);
			Screens.topButtons.show();
			var blackScreen:BlackScreen = new BlackScreen(0, 20);
		}
		
		public static function updateLevelButtons ():void {
			for (var i:int = 0; i < Screens.levelSelect.numChildren; i ++) {
				var child:* = Screens.levelSelect.getChildAt(i) as MovieClip;
				if (child is ButtonMax) {
					var status:int = LevelData.status[child.id];
					child.graphic.gotoAndStop(status);
					status == 1 ? child.disable() : child.enable();
				}
			}
			//Service.readObject(LevelData.status, 'UPDATE STATUS');
		}
		
		
		// GETTERS
		static public function get _effectsInterface():Sprite {
			return _effectsInterface;
		}
	
	}

}