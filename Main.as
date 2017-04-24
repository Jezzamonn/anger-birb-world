package  {
	
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width=600, height=400)]
	public class Main extends MovieClip {

		public static const DIST_MILES:int = 7419;
		public static const DIST_KM:int = 11940;
		public static const DIST_DEG:int = 150;
		public static const DEG_TO_KM:Number = DIST_KM / DIST_DEG;

		public static const US_START_ANGLE:Number = -45;
		public static const US_END_ANGLE:Number = 0;
		public static const AUS_START_ANGLE:Number = 150;
		public static const AUS_END_ANGLE:Number = 165;

		public static const WIDTH:int = 600;
		public static const HEIGHT:int = 400;

		public var titleView:TitleView;
		public var instructionsView:InstructionsView;
		public var worldView:WorldView;
		public var launchView:LaunchView;
		public var scoreView:ScoreView;
		public var landView:LandView;

		public var sky:Shape;
		public static const SKY_COLOR:int = 0x4970F9;
		public static const SPACE_COLOR:int = 0x040F19;

		public function Main() {
			//launchView = new LaunchView();
			//launchView.onMouseMove(mouseX, mouseY);

			titleView = new TitleView();

			sky = new Shape();
			sky.x = WIDTH / 2;
			sky.y = HEIGHT / 2;
			drawSky();

			addChild(sky);
			addChild(titleView);

			stage.addEventListener(Event.ENTER_FRAME, everyFrame);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}

		public function onMouseMove(evt:MouseEvent):void {
			if (launchView) {
				launchView.onMouseMove(evt.stageX, evt.stageY);
			}
		}

		public function onMouseUp(evt:MouseEvent):void {
			if (launchView && launchView.grapped) {
				launchView.onMouseMove(evt.stageX, evt.stageY);
				launch();
			}
			else if (scoreView) {
				restart();
			}
			else if (instructionsView) {
				restart();
			}
			else if (titleView) {
				goToInstructions();
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
			if (launchView) {
				launchView.update();
				if (launchView.done) {
					zoomOut();
				}
			}
			if (titleView) {
				titleView.update();
			}
		}

		public function removeAll():void {
			for each (var thing:* in [titleView, instructionsView, worldView, launchView, scoreView, landView]) {
				if (thing != null && contains(thing)) {
					removeChild(thing);
				}
			}
		}

		// -- State changing functions --

		public function goToInstructions():void {
			removeAll();
			titleView = null;

			instructionsView = new InstructionsView();
			addChild(instructionsView);
		}

		public function launch():void {
			launchView.launch();
		}

		public function zoomOut():void {
			worldView = new WorldView();

			worldView.dr = -4 * launchView.launchDx;
			worldView.birb.dy = 4 * launchView.launchDy;
			worldView.birb.dRot = Rndm.float(-30, 30);

			removeAll();
			launchView = null;

			addChild(worldView);

			drawSky();

			SoundManager.woosh();
		}

		public function land():void {
			var angle:Number = normaliseAngle(worldView.world.rotation);
			var angleDiff:Number = Math.abs(normaliseAngle(angle - DIST_DEG));
			var distDiff:Number = angleDiff * DEG_TO_KM;

			var onGround = false;
			if (US_START_ANGLE < angle && angle < US_END_ANGLE) {
				onGround = true;
			}
			if (AUS_START_ANGLE < angle && angle < AUS_END_ANGLE) {
				onGround = true;
			}

			landView = new LandView(onGround);
			if (worldView.dr < 0) {
				landView.birb.dx *= -1;
				landView.birb.x *= -1;
			}

			scoreView = new ScoreView();

			scoreView.text = "You missed by " + distDiff.toFixed(2) + " km.\n\n" + 
			"Click to try again!";

			removeAll();
			worldView = null;

			addChild(landView);
			addChild(scoreView);

			drawSky();

			SoundManager.fall();
		}

		public function normaliseAngle(angle:Number):Number {
			angle %= 360;
			if (angle <= -180) {
				angle += 360;
			}
			if (angle > 180) {
				angle -= 360;
			}
			return angle;
		}

		public function restart():void {
			launchView = new LaunchView();
			launchView.onMouseMove(mouseX, mouseY);

			removeAll();
			scoreView = null;
			landView = null;
			titleView = null;
			instructionsView = null;

			addChild(launchView);
		}

	}
	
}
