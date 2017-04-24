package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class TextBox extends Sprite {

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

		public function TextBox(size:Number):void {
			textField = new TextField();
			textField.width = Main.WIDTH;
			textField.height = Main.HEIGHT;
			textField.embedFonts = true;

			textFormat = new TextFormat("Dimbox", size, 0xC64A3B);
			textFormat.align = TextFormatAlign.CENTER;
			textField.defaultTextFormat = textFormat;

			shadowField = new TextField();
			shadowField.y = textField.y + 3 * (size / 50);
			shadowField.x = textField.x + 2 * (size / 50);
			shadowField.width = Main.WIDTH;
			shadowField.height = Main.HEIGHT;
			shadowField.embedFonts = true;

			shadowFormat = new TextFormat("Dimbox", size, 0x260711);
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