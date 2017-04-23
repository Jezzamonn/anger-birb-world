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

		public var grapped:Boolean = false;
		public var launched:Boolean = false;
		public var count:int = 0;
		public var done:Boolean = false;

		public var launchDx:Number = 0;
		public var launchDy:Number = 0;

		public function LaunchView():void {
			launchZone = new LaunchZone();
			addChild(launchZone);

			birb = launchZone.birb;
			birb.addEventListener(MouseEvent.MOUSE_DOWN, startGrap);

			startX = launchZone.birb.x;
			startY = launchZone.birb.y;

			this.x = Main.WIDTH / 2;
			this.y = Main.HEIGHT / 2;
		}

		public function startGrap(evt:MouseEvent):void {
			grapped = true;
			birb.removeEventListener(MouseEvent.MOUSE_DOWN, startGrap);
		}

		public function onMouseMove(mouseX:Number, mouseY:Number):void {
			if (!launched && grapped) {
				var point:Point = new Point(mouseX, mouseY);
				point = globalToLocal(point);
				birb.x = Util.lerp(point.x, startX, 0.2);
				birb.y = Util.lerp(point.y, startY, 0.2);
			}
		}

		public function launch():void {
			launched = true;
			birb.dx = 200 * xDiff;
			birb.dy = 200 * yDiff;
			launchDx = xDiff;
			launchDy = yDiff;
		}

		public function update():void {
			birb.move();
			drawSlings();
			if (launched) {
				count ++;
				if (count > 5) {
					done = true;
				}
			}
		}

		public function drawSlings():void {
			var dx:Number = birb.x - startX;
			var dy:Number = birb.y - startY;
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