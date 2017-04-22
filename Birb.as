package  {
	
	import flash.display.MovieClip;
	
	
	public class Birb extends MovieClip {
		
		public var dx:Number = 0;
		public var dy:Number = 0;

		public var dRot:Number = 0;
		
		public var gravity:Number = 0.2;

		public function Birb() {
			// constructor code
		}

		public function move():void {
			x += dx;
			y += dy;
			rotation += dRot;
			dy += gravity;
		}
	}
	
}
