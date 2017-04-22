package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	[SWF(width=600, height=400)]
	public class Main extends MovieClip {
		
		public static const WIDTH:int = 600;
		public static const HEIGHT:int = 400;

		public var birbs:Array;

		public var count:int = 0;

		public function Main() {
			birbs = [];

			stage.addEventListener(Event.ENTER_FRAME, everyFrame);
		}

		public function everyFrame(evt:Event):void {
			count ++;

			updateBirbs();

			if (count % 20 == 0) {
				addBirb();
			}
		}

		public function updateBirbs():void {
			for each (var birb:* in birbs) {
				birb.move();
			}
		}

		public function addBirb():void {
			var birb:Birb = new Birb();
			birb.x = 0;
			birb.y = HEIGHT;
			birb.dx = Rndm.float(1, 10)
			birb.dy = Rndm.float(-10, -5);
			birb.dRot = Rndm.float(-30, 30);
			birb.scaleX = 0.1;
			birb.scaleY = 0.1;
			birbs.push(birb);
			addChild(birb);
		}
	}
	
}
