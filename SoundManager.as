package  {

	import flash.media.Sound;
	
	public class SoundManager {

		public static function pull():void {
			(new Pull1()).play();
		}
		
		public static function launch():void {
			(new Launch1()).play();
		}

		public static function woosh():void {
			(new Woosh1()).play();
		}

		public static function fall():void {
			(new Fall1()).play();
		}

		public static function splash():void {
			(new Splash1()).play();
		}

		public static function crash():void {
			(new Crash1()).play();
		}
	}

}