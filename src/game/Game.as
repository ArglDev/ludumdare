package game {
	
	import com.soulgame.system.*;
	import interfaces.*;
	
	/**
	 * ...
	 * @author Argl
	 */
	public class Game extends GameCore {
		
		public function Game() {
			var p1:Planet = new Planet(400, 300, 1);
			var p4:Planet = new Planet(600, 150, 1);
			var p2:Planet = new Planet(400, 450, 2, p1);
			var p3:Planet = new Planet(400, 150, 2, p4);
			var p5:Planet = new Planet(200, 400, 2, p1);
			Global.stage.addChild(p1);
			Global.stage.addChild(p2);
			Global.stage.addChild(p3);
			Global.stage.addChild(p4);
			Global.stage.addChild(p5);
		}
	
	}

}