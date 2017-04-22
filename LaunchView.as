package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	
	public class LaunchView extends Sprite {

		public var launchZone:MovieClip;

		public var startX:Number;
		public var startY:Number;

		public var birb:Birb;

		public function LaunchView():void {
			launchZone = new LaunchZone();
			addChild(launchZone);

			birb = launchZone.birb;

			startX = launchZone.birb.x;
			startY = launchZone.birb.y;
		}

		public function onMouseMove(evt:MouseEvent):void {
			var point:Point = new Point(evt.stageX, evt.stageY);
			point = globalToLocal(point);
			birb.x = Util.lerp(point.x, startX, 0.2);
			birb.y = Util.lerp(point.y, startY, 0.2);
		}

		public function get xDiff():Number {
			return (startX - birb.x) / Main.WIDTH;
		}

		public function get yDiff():Number {
			return (startY - birb.y) / Main.HEIGHT;
		}
	}

}