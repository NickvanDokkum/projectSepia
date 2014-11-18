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
		private var crappybuttonArt : MovieClip;
		
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(MouseEvent.MOUSE_OVER);
			stage.addEventListener(MouseEvent.MOUSE_DOWN);
			stage.addEventListener(MouseEvent.MOUSE_UP);
			
			
			
		}
		
		public function Menu() 
		{
			crappybuttonArt = new crappyButtonArt;
			
		}
		
	}

}