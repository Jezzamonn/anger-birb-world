package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class WorldView extends Sprite {

		public static const RADIUS:int = 125;
		public var gravity:Number = 0.02;

		public var world:MovieClip;
		public var birb:Birb;

		public var dr:Number = 0;

		public function WorldView():void {
			world = new World();
			world.rotation = -3;
			addChild(world);

			birb = new Birb();
			birb.y = -(RADIUS + 5);
			birb.scaleX = -0.05;
			birb.scaleY = 0.05;
			addChild(birb);

			this.x = Main.WIDTH / 2;
			this.y = Main.HEIGHT / 2;
		}

		public function update():void {
			world.rotation += dr;
			birb.move();
			birb.dy += gravity;
		}

		public function get shouldLand():Boolean {
			return -birb.y < RADIUS;
		}
	}

}