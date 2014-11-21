package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Main extends Sprite 
	{
		public static var main: Main;
		public var _game:Game;
		//public var _menu:Menu;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			main = this;
			_game = new Game();
			addChild(_game);

			//_menu = new Menu();
			//addChild(_menu);
		}
		/*public function startGame()
		{
			if (_menu.startPressed == true)
			{
				removeChild(_menu);
				_menu.startnow == true;
				trace("adafad");
			}
		}
		public function addgame()
		{
			if (_menu.startnow == true)
			{
				trace("ajshvjlshfmjkhj856758484dafad");
				_menu.addedGame == true;
			}
		}
		
		public function checkGame()
		{
			if (_menu.addedGame == true)
			{
				trace("adafaffagrgead");
				addChild(_game);
			}
		}*/
	}
}