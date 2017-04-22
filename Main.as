package  {
	
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width=600, height=400)]
	public class Main extends MovieClip {

		public static const DIST_MILES:int = 7419;
		public static const DIST_KM:int = 11940;
		public static const DIST_DEG:int = 155;
		
		public static const WIDTH:int = 600;
		public static const HEIGHT:int = 400;

		public var worldView:WorldView;
		public var launchView:LaunchView;
		public var scoreView:ScoreView;
		public var landView:LandView;

		public var sky:Shape;
		public static const SKY_COLOR:int = 0x4970F9;
		public static const SPACE_COLOR:int = 0x040F19;

		public function Main() {
			launchView = new LaunchView();

			sky = new Shape();
			sky.x = WIDTH / 2;
			sky.y = HEIGHT / 2;
			drawSky();

			addChild(sky);
			addChild(launchView);

			stage.addEventListener(Event.ENTER_FRAME, everyFrame);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}

		public function onMouseMove(evt:MouseEvent):void {
			if (launchView) {
				launchView.onMouseMove(evt);
			}
		}

		public function onMouseUp(evt:MouseEvent):void {
			if (launchView) {
				launchView.onMouseMove(evt);
				launch();
			}
			if (scoreView) {
				restart();
			}
		}

		public function drawSky():void {
			if (worldView) {
				sky.graphics.beginFill(SPACE_COLOR);
			}
			else {
				sky.graphics.beginFill(SKY_COLOR);
			}
			sky.graphics.drawRect(-WIDTH, -HEIGHT, 2 * WIDTH, 2 * HEIGHT);
			sky.graphics.endFill();
		}

		public function everyFrame(evt:Event):void {
			if (worldView) {
				worldView.update();
				if (worldView.shouldLand) {
					land();
				}
			}
			if (landView) {
				landView.update();
			}
		}

		// -- State changing functions --

		public function launch():void {
			worldView = new WorldView();

			worldView.dr = -4 * launchView.xDiff;
			worldView.birb.dy = 4 * launchView.yDiff;
			worldView.birb.dRot = Rndm.float(-30, 30);

			removeChild(launchView);
			launchView = null;

			addChild(worldView);

			drawSky();
		}

		public function land():void {
			landView = new LandView();

			scoreView = new ScoreView();
			var angle:Number = worldView.world.rotation;
			var dist:Number = DIST_KM * angle / DIST_DEG;
			var difference:Number = Math.abs(dist - DIST_KM);

			scoreView.textField.text = "You missed by " + difference.toFixed(2) + " km.\n\n" + 
			"Click to try again";

			removeChild(worldView);
			worldView = null;

			addChild(landView);
			addChild(scoreView);

			drawSky();
		}

		public function restart():void {
			launchView = new LaunchView();

			removeChild(scoreView);
			scoreView = null;
			removeChild(landView);
			landView = null;

			addChild(launchView);
		}

	}
	
}
