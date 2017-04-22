package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	
	public class LandView extends Sprite {

		// Either water or ground tbh
		public var ground:MovieClip;

		public var birb:Birb;

		public function LandView(onGround:Boolean = true):void {
			if (onGround) {
				ground = new Ground();
			}
			else {
				ground = new Water();
			}
			addChild(ground);

			birb = new Birb();
			addChild(birb);

			birb.dy = 20;
			birb.dx = -5;
			birb.dRot = 30;
			birb.y = -0.7 * Main.HEIGHT;
			birb.x = 40;
			birb.scaleX = -1;

			this.x = Main.WIDTH / 2;
			this.y = Main.HEIGHT / 2;
		}

		public function update():void {
			birb.move();
		}

	}

}