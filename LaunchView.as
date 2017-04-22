package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	
	public class LaunchView extends Sprite {

		public var launchZone:MovieClip;

		public var startX:Number;
		public var startY:Number;

		public function LaunchView():void {
			launchZone = new LaunchZone();
			addChild(launchZone);

			startX = launchZone.birb.x;
			startY = launchZone.birb.y;
		}

		public function onMouseMove(evt:MouseEvent):void {
			var point:Point = new Point(evt.stageX, evt.stageY);
			point = globalToLocal(point);
			launchZone.birb.x = Util.lerp(point.x, startX, 0.2);
			launchZone.birb.y = Util.lerp(point.y, startY, 0.2);
		}
	}

}