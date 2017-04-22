package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	[SWF(width=600, height=400)]
	public class Main extends MovieClip {
		
		public static const WIDTH:int = 600;
		public static const HEIGHT:int = 400;

		public var worldView:WorldView;

		public function Main() {
			worldView = new WorldView();
			worldView.x = WIDTH / 2;
			worldView.y = HEIGHT / 2;
			addChild(worldView);

			worldView.dr = 1;
			worldView.birb.dy = -1;
			worldView.birb.rotation = Rndm.float(-30, 30);

			stage.addEventListener(Event.ENTER_FRAME, everyFrame);
		}

		public function everyFrame(evt:Event):void {
			worldView.update();
		}

	}
	
}
