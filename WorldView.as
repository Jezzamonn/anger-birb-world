package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class WorldView extends Sprite {

		public static const RADIUS:int = 125;
		public var gravity:Number = 0.01;

		public var world:MovieClip;
		public var birb:Birb;

		public var dr:Number = 0;

		public function WorldView():void {
			world = new World();
			addChild(world);

			birb = new Birb();
			birb.y = -RADIUS;
			birb.scaleX = -0.05;
			birb.scaleY = 0.05;
			addChild(birb);
		}

		public function update():void {
			world.rotation += dr;
			birb.move();
			birb.dy += gravity;
		}
	}

}