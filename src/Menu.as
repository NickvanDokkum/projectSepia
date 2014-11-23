package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author ... The Hitman
	 * 
	 */
	public class Menu extends MovieClip
	{
		[Embed(source = "../lib/butplaceholdercrap.png")]
		private var crappyButtonArt : Class;
		private var crappybuttonArt : Bitmap;
		
		public var startPressed : Boolean;
		public var startnow : Boolean;
		public var _Game:Game;
		public var addedGame: Boolean;

		public function Menu() 
		{
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			crappybuttonArt = new crappyButtonArt;
			stage.addChild(crappybuttonArt);
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
		 
			//stage.addEventListener(MouseEvent.MOUSE_DOWN,);

		}

		public function onMouseDown(e:MouseEvent):void
		{
			if (onMouseDown == true)
			{
				startPressed = true;
			}
			
		}

	}

}