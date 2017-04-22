package  {
	
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width=600, height=400)]
	public class Main extends MovieClip {
		
		public static const WIDTH:int = 600;
		public static const HEIGHT:int = 400;

		public var worldView:WorldView;
		public var launchView:LaunchView;

		public var sky:Shape;
		public static const SKY_COLOR:int = 0x4970F9;
		public static const SPACE_COLOR:int = 0x040F19;

		public function Main() {
			//worldView = new WorldView();
			//worldView.x = WIDTH / 2;
			//worldView.y = HEIGHT / 2;

			//worldView.dr = 1;
			//worldView.birb.dy = -1;
			//worldView.birb.rotation = Rndm.float(-30, 30);

			launchView = new LaunchView();
			launchView.x = WIDTH / 2;
			launchView.y = HEIGHT / 2;

			sky = new Shape();
			sky.x = WIDTH / 2;
			sky.y = HEIGHT / 2;
			drawSky();

			addChild(sky);
			addChild(launchView);
			//addChild(worldView);

			stage.addEventListener(Event.ENTER_FRAME, everyFrame);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}

		public function onMouseMove(evt:MouseEvent):void {
			if (launchView) {
				launchView.onMouseMove(evt);
			}
		}

		public function drawSky():void {
			sky.graphics.beginFill(SKY_COLOR);
			sky.graphics.drawRect(-WIDTH, -HEIGHT, 2 * WIDTH, 2 * HEIGHT);
			sky.graphics.endFill();
		}

		public function everyFrame(evt:Event):void {
			if (worldView) {
				worldView.update();
			}
		}

	}
	
}
