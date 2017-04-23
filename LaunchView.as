package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	
	public class LaunchView extends Sprite {

		public static const SLING_COLOR:int = 0x991616;

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

			this.x = Main.WIDTH / 2;
			this.y = Main.HEIGHT / 2;
		}

		public function onMouseMove(evt:MouseEvent):void {
			var point:Point = new Point(evt.stageX, evt.stageY);
			point = globalToLocal(point);
			birb.x = Util.lerp(point.x, startX, 0.2);
			birb.y = Util.lerp(point.y, startY, 0.2);

			var dx:Number = birb.x - (launchZone.farSling.x + launchZone.closeSling.x) / 2;
			var dy:Number = birb.y - (launchZone.farSling.y + launchZone.closeSling.y) / 2;
			var dr:Number = Math.sqrt(dx * dx + dy * dy);
			var bRad:Number = birb.width / 2;

			drawSling(launchZone.farSling, birb.x + bRad * dx / dr, birb.y + bRad * dy / dr);
			drawSling(launchZone.closeSling, birb.x + bRad * dx / dr, birb.y + bRad * dy / dr);
		}

		public function drawSling(container:MovieClip, x:Number, y:Number):void {
			container.graphics.clear();
			container.graphics.lineStyle(15, SLING_COLOR);
			// starting at 0, 0 by default
			container.graphics.lineTo(x - container.x, y - container.y);
		}

		public function get xDiff():Number {
			return (startX - birb.x) / Main.WIDTH;
		}

		public function get yDiff():Number {
			return (startY - birb.y) / Main.HEIGHT;
		}
	}

}