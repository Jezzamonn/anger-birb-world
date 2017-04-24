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

		public function TextBox(size:Number, align:String = null, mainColor:int = 0xC64A3B, shadowColor = 0x260711):void {
			if (align == null) {
				align = TextFormatAlign.CENTER;
			}
			textField = new TextField();
			textField.width = Main.WIDTH;
			textField.height = Main.HEIGHT;
			textField.embedFonts = true;
			textField.wordWrap = true;

			textFormat = new TextFormat("Dimbox", size, mainColor);
			textFormat.align = align;
			textField.defaultTextFormat = textFormat;

			if (shadowColor >= 0) {
				shadowField = new TextField();
				shadowField.y = textField.y + 3 * (size / 50);
				shadowField.x = textField.x + 2 * (size / 50);
				shadowField.width = Main.WIDTH;
				shadowField.height = Main.HEIGHT;
				shadowField.embedFonts = true;
				shadowField.wordWrap = true;

				shadowFormat = new TextFormat("Dimbox", size, shadowColor);
				shadowFormat.align = align;
				shadowField.defaultTextFormat = shadowFormat;
				
				addChild(shadowField);
			}
			addChild(textField);
		}

		public function set text(value:String):void {
			textField.text = value;
			if (shadowField) {
				shadowField.text = value;
			}
		}

	}
}