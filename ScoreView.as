package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class ScoreView extends Sprite {

		public var textBox:TextBox;

		public function ScoreView():void {
			textBox = new TextBox(50);
			textBox.y = 0.2 * Main.HEIGHT;
			addChild(textBox);
		}

		public function set text(value:String):void {
			textBox.text = value;
		}

	}

}