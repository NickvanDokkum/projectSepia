package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Player extends MovieClip
	{
		private var bulletTimeBool:Boolean = false;

		private var _stage : Stage;

		public var player:MovieClip = new cowboy();
		
		private var buttonA:Boolean = false;
		private var buttonD:Boolean = false;
		public function Player(stage : Stage) 
		{
			_stage = stage;
			if (_stage) init();
			else _stage.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			_stage.removeEventListener(Event.ADDED_TO_STAGE, init);
			player = new cowboy();
			player.x = 200;
			player.y = 500;
			Main.main.stage.addChild(player);
			

			_stage.addEventListener(Event.ENTER_FRAME, updateFunction);
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			_stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		public function onKeyDown(e:KeyboardEvent):void {
			if (e.keyCode == 65) {
				buttonA = true;
			}
			else if (e.keyCode == 68) {
				buttonD = true;
			}
		}
		public function onKeyUp(e:KeyboardEvent):void {
			if (e.keyCode == 65) {
				buttonA = false;
			}
			else if (e.keyCode == 68) {
				buttonD = false;
			}
		}
		public function updateFunction(e:Event):void {
			if (buttonD == true && bulletTimeBool == false) {
				Main.main._game.moveEverythingLeft();
			}
			else if (buttonA == true && bulletTimeBool == false) {
				Main.main._game.moveEverythingRight();
			}
		}
		public function gotHit():void {
			//player death animation here, please
			trace("you just got shot");
		}
		public function bulletTime():void {
			bulletTimeBool = true;
		}
		public function bulletTimeOff():void {
			bulletTimeBool = false;
		}
	}
}