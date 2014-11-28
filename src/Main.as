package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Main extends Sprite 
	{
		[Embed(source="../lib/melodie.mp3")]
		private var bGMusic : Class; 		 
		private var bgMusic : Sound;
		
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
				bgMusic = (new bGMusic) as Sound; 			     
				bgMusic.play(0, 9999);
				main = this;
				_game = new Game();
				_menu = new Menu();
				addChild(_menu);
				
				
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
				_game = new Game();
				addChild(_game);
				addedmenu = true;
				removeChild(_menu);
			}
			else {}
			
			
		}
		
		public function destroyGame():void 
		{
			
			trace("sjdjsjkdlajdal");
			removeChild(_game);
			addChild(_menu);
			start();
			_game = new Game();
			addedmenu = false;
			trace("ccdyhfdffggngngff");
			
		}
			
		public function start():void
		{
			_game = new Game();
			_menu.addEventListener("PLAY_CLICKED", Start_menu);
		//	_menu.addEventListener("PLAY_CLICKED", restart);
		}
	}
}
