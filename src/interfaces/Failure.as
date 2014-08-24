package interfaces {
	
	/**
	 * ...
	 * @author Argl
	 */
	public class Failure {
		
		private static const LIST:Array = [];
		private static var _index:int;
		
		public static function init():void {
			_index = 0;
			
			var i = 0;
			LIST[i++] = "Level failed.";
			LIST[i++] = "Try again please.";
			LIST[i++] = "Try again, again.";
			LIST[i++] = "That didn't work.";
			LIST[i++] = "Try to connect PLANETS.";
			LIST[i++] = "Not like that...";
			LIST[i++] = "Poor choice.";
			LIST[i++] = "You did better on last level.";
			LIST[i++] = "Ha, ha, ha!";
			LIST[i++] = "You 1, Universe 0.";
			LIST[i++] = "This isn't golf.";
			LIST[i++] = "Stop clicking randomly.";
			LIST[i++] = "STRIKE.";
			LIST[i++] = "No comments."
			LIST[i++] = "Ouch, 1.5M people just died.";
			LIST[i++] = "Go back to the tutorial.";
			LIST[i++] = "NOOOOOOOOOOOOOOOOOOOOOOOOOB.";
			LIST[i++] = "Sorry, I lost it.";
			LIST[i++] = "You can do this.";
			LIST[i++] = "We have faith in you.";
			LIST[i++] = "Do we?";
			LIST[i++] = "Just kidding, we do.";
			LIST[i++] = "... Do we?";
			LIST[i++] = "Maybe it's just too hard."
			LIST[i++] = "Blame Zhyr, not me.";
			LIST[i++] = "Levels of mine are easier...";
			LIST[i++] = "Ask some help, seriously.";
			LIST[i++] = "SOMEONE HAS TO STOP YOU!";
			LIST[i++] = "I'm so tired right now.";
			LIST[i++] = "Why am I still writting?";
			LIST[i++] = "Oh, I have an idea.";
			LIST[i++] = "I'm adding a new feature.";
			LIST[i++] = "That's it. Ha, ha!";
			LIST[i++] = "You gonna love it.";
			LIST[i++] = "I'm OUT! See you!";
			LIST[i++] = "New feature : FAILS COUNT!";
		}
		
		public static function get comment():String {
			if (_index >= LIST.length) {
				return 'FAIL - ' + Main.game.totalDeath;
			} else {
				_index++;
				return '' + LIST[_index - 1] + '';
			}
		}
		
		static public function get index():int {
			return _index;
		}
		
		static public function set index(value:int):void {
			_index = value;
		}
	
	}

}