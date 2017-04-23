package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class ScoreView extends Sprite {

		[Embed(source="Dimbo Regular.ttf",
			fontName = "Dimbox",
        	mimeType = "application/x-font",
        	advancedAntiAliasing="true",
        	embedAsCFF="false")]
		private static const FONT:Class;

		public var textField:TextField;
		public var textFormat:TextFormat;
		public var shadowField:TextField;
		public var shadowFormat:TextFormat;

		public function ScoreView():void {
			textField = new TextField();
			textField.y = 0.2 * Main.HEIGHT;
			textField.width = Main.WIDTH;
			textField.height = Main.HEIGHT;
			textField.embedFonts = true;

			textFormat = new TextFormat("Dimbox", 50, 0xC64A3B);
			textFormat.align = TextFormatAlign.CENTER;
			textField.defaultTextFormat = textFormat;

			shadowField = new TextField();
			shadowField.y = textField.y + 3;
			shadowField.x = textField.x + 2;
			shadowField.width = Main.WIDTH;
			shadowField.height = Main.HEIGHT;
			shadowField.embedFonts = true;

			shadowFormat = new TextFormat("Dimbox", 50, 0x260711);
			shadowFormat.align = TextFormatAlign.CENTER;
			shadowField.defaultTextFormat = shadowFormat;
			
			addChild(shadowField);
			addChild(textField);
		}

		public function set text(value:String):void {
			textField.text = value;
			shadowField.text = value;
		}
	}

}