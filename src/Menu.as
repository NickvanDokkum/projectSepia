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
		
		[Embed(source = "../lib/background_sepia_other_01.jpg")]
		private var bgArt:Class;
		private var background : Bitmap;
		
		[Embed(source="../lib/background_02 (3).png")]
		private var bgArt_two: Class;
		public var background_two: Bitmap;
		
		
		//public var button:MovieClip = new options;
		

		public function Menu() 
		{
			//button = new options;
			//addChild(button);
			
			background = new bgArt();
			background_two = new bgArt_two();
			addChild(background);
			addChild(background_two);
			
		}

	}

}