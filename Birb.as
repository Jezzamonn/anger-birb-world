package  {
	
	import flash.display.MovieClip;
	
	
	public class Birb extends MovieClip {
		
		public var dy:Number = 0;
		public var dx:Number = 0;
		public var dRot:Number = 0;
		
		public function Birb() {
			// constructor code
		}

		public function move():void {
			y += dy;
			x += dx;
			rotation += dRot;
		}
	}
	
}
