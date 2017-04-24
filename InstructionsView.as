package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextFormatAlign;

	public class InstructionsView extends Sprite {

		public static const WORDS:String = "Anger Birb was happily living in his home in San Francisco when some bad pigs took [his/her] eggs! This time the pigs have fled overseas, all the way to Sydney. Anger Birb swore that [he/she] would seek revenge on the bad pigs.\n\nClick to drag and fire Anger Birb and hit those pigs for victory!";
		public var textBox:TextBox;

		public var ground:MovieClip;

		public function InstructionsView():void {
			ground = new Ground();
			ground.x = Main.WIDTH / 2;
			ground.y = Main.HEIGHT / 2;

			textBox = new TextBox(30, TextFormatAlign.LEFT, 0x25277E, -1);
			textBox.y = 0.05 * Main.HEIGHT;
			var gender:Boolean = Rndm.boolean();
			textBox.text = WORDS
				.replace("[his/her]", gender ? "his" : "her")
				.replace("[he/she]", gender ? "he" : "she");

			addChild(ground);
			addChild(textBox);
		}
	}

}