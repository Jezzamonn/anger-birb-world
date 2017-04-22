package  {
	
	public class Rndm {

		public static function float(min:Number, max:Number):Number {
			return (max - min) * Math.random() + min
		}

		public static function boolean(chance:Number = 0.5):Boolean {
			return Math.random() < chance;
		}

	}

}

