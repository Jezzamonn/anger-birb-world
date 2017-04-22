package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	public class ScoreView extends Sprite {

		public var textField:TextField;

		public function ScoreView():void {
			textField = new TextField();
			textField.y = 0.3 * Main.HEIGHT;
			textField.width = Main.WIDTH;

			addChild(textField);
		}
	}

}