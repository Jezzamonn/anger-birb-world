package  {
	
	public class Util {

		public static function colorLerp(c1:int, c2:int, amt:Number):int {
			var r1:int = (c1 >> 16) && 0xFF;
			var g1:int = (c1 >> 8) && 0xFF;
			var b1:int = (c1) && 0xFF;

			var r2:int = (c2 >> 16) && 0xFF;
			var g2:int = (c2 >> 8) && 0xFF;
			var b2:int = (c2) && 0xFF;

			var r3:int = int(r1 * (1 - amt) + r2 * amt);
			var g3:int = int(g1 * (1 - amt) + g2 * amt);
			var b3:int = int(b1 * (1 - amt) + b2 * amt);

			return (r3 << 16) | (g3 << 8) | b3;
		}

		public static function lerp(val1:Number, val2:Number, amt:Number):Number {
			return val1 * (1 - amt) + val2 * amt;
		}

	}

}