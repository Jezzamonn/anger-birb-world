package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class TitleView extends Sprite {

		public var titleBox:TextBox;
		public var subTitleBox:TextBox;
		public var callToActionBox:TextBox;

		public var ground:MovieClip;
		
		public var count:int;

		public function TitleView():void {
			ground = new Ground();
			ground.x = Main.WIDTH / 2;
			ground.y = Main.HEIGHT / 2;

			titleBox = new TextBox(100);
			titleBox.y = 0.05 * Main.HEIGHT;
			titleBox.text = "Anger Birb:\nWorld";

			subTitleBox = new TextBox(40);
			subTitleBox.y = 0.65 * Main.HEIGHT;
			subTitleBox.text = "a dumb game by @Jezzamonn";

			callToActionBox = new TextBox(30);
			callToActionBox.y = 0.85 * Main.HEIGHT;
			callToActionBox.text = "click to start";
			callToActionBox.visible = false;

			addChild(ground);
			addChild(titleBox);
			addChild(subTitleBox);
			addChild(callToActionBox);
		}



		public function update():void {
			count ++;
			if (count > 24) {
				callToActionBox.visible = !callToActionBox.visible;
				count = 0;
			}
		}
	}

}