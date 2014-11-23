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
		
		public var checkPos: Boolean;
		public var i:Number;
		
		[Embed(source = "../lib/background_sepia_other_01.jpg")]
		private var bgArt:Class;
		private var background : Bitmap;
		
		[Embed(source = "../lib/background_02.png")]
		private var bgArt_two_one: Class;
		public var background_two_one: Bitmap;
		
		[Embed(source = "../lib/background_02.png")]
		private var bgArt_two_two: Class;
		public var background_two_two: Bitmap;
		
		public function Background() 
		{
			
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			background = new bgArt;
			background_two_one = new bgArt_two_one;
			background_two_two = new bgArt_two_two;
			stage.addChild(background);
			stage.addChild(background_two_one);
			stage.addChild(background_two_two);
			background_two_two.x = 1500;
			checkPos = true;
			i = 0.1;
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function loop(e:Event):void 
		{
		
			if (checkPos == true)
			{
				background_two_one.x += i;
				background_two_two.x += 0.06;
			}
		
			if (background_two_one.x > 1250)
			{
				background_two_one.x = -1250; 
			}
		 
			if(background_two_two.x > 1250)
			{
				background_two_two.x = -1250;
			}
		}
	}

}