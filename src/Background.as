package  
{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author ... The Hitman
	 */
	public class Background extends MovieClip
	{
		[Embed(source = "../lib/background_sepia_01.jpg")]
		private var bgArt:Class;
		private var background : Bitmap;
		
		public function Background() 
		{
			
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			background = new bgArt;
			stage.addChild(background);
		}
	}

}