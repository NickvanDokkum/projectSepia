package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Main extends Sprite 
	{
		public static var main: Main;
		public var _game:Game;
		public var _menu:Menu;
		public var startPressed : Boolean;
		public var startnow : Boolean;
		public var dead : Boolean;
		public var addedmenu:Boolean;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
			private function init(e:Event = null):void 
			{
				removeEventListener(Event.ADDED_TO_STAGE, init);
				main = this;

				_menu = new Menu();
				addChild(_menu);
				
				_game = new Game();
				//addChild(_game);
		
				stage.addEventListener(MouseEvent.MOUSE_DOWN, Start_menu);
				
			}
			
			public function onMouseDown(e:MouseEvent):void
		{
			if (onMouseDown == true)
			{
				startPressed = true;
			}
			
		}
		
		
		public function  Start_menu(e:MouseEvent):void 
		{
			if (addedmenu == false)
			{
			
				dispatchEvent(new Event("START"));
				_game = new Game
				addChild(_game);
				addedmenu = true;
				removeChild(_menu);
			}
			else {}
			
			
		}
		
		public function destroyGame():void 
		{
			trace(Main.main._game._enemy.enemyArray.length);
			trace("sjdjsjkdlajdal");
			removeChild(_game);
			addChild(_menu);
			start();
			addedmenu = true;
		}
			
		public function start():void
		{
			_menu.addEventListener("PLAY_CLICKED", Start_menu);
		//	_menu.addEventListener("PLAY_CLICKED", restart);
		}
	}
}
