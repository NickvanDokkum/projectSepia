package  
{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import Player;
	/**
	 * ...
	 * @author ... The Hitman
	 */
	public class Background extends MovieClip
	{
		
		public var player:Player;
		public var checkPosRight: Boolean;
		public var checkPosLeft: Boolean;
		
		
		[Embed(source = "../lib/background_sepia_other_01.jpg")]
		private var bgArt:Class;
		private var background : Bitmap;
		
		[Embed(source="../lib/background_03.png")]
		private var GroundArt:Class;
		private var groundArt : Bitmap;
		
		[Embed(source="../lib/background_04.png")]
		private var bgArt_three: Class;
		public var background_three_one: Bitmap;
		
		public var background_three_two: Bitmap;
		
		[Embed(source="../lib/background_06.png")]
		private var bgArt_five: Class;
		public var background_five_one: Bitmap;
		
		public var background_five_two: Bitmap;
		
		[Embed(source="../lib/background_05.png")]
		private var bgArt_four: Class;
		public var background_four_one: Bitmap;
		
		public var background_four_two: Bitmap;
		
		
		[Embed(source="../lib/background_02 (3).png")]
		private var bgArt_two: Class;
		public var background_two_one: Bitmap;
		
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
			background_two_one = new bgArt_two;
			background_two_two = new bgArt_two;
			
			background_three_one = new bgArt_three;
			background_three_two = new bgArt_three;
			
			groundArt = new GroundArt;
			stage.addChild(background);
			stage.addChild(background_two_one);
			stage.addChild(background_two_two);
			stage.addChild(background_three_one);
			stage.addChild(background_three_two);
			
			stage.addChild(background_four_one);
			stage.addChild(background_four_two);
			stage.addChild(background_five_one);
			stage.addChild(background_five_two);
			
			stage.addChild(groundArt);
			background_two_two.x = -1275;
			background_three_two.x = -2188;
			background_three_one.y = -53;
			background_three_two.y = -53;
			
			background_four_two.x = -1275;
			background_five_two.x = -1275;
			background_three_one.y = -53;
			background_three_two.y = -53;
			
			checkPosLeft = false;
			checkPosRight = false;
		}
		public function moveLeft() : void
		{
			
			background_two_one.x += -0.1;
			background_two_two.x += -0.1;
			background_three_one.x += -1;
			background_three_two.x += -1;
			
			background_four_one.x += -0.1;
			background_four_two.x += -0.1;
			background_five_one.x += -2;
			background_five_two.x += -2;
			
			
			if (background_two_one.x < -1275)
			{
				background_two_one.x = 1275; 
			}
		 
			if(background_two_two.x < -1275)
			{
				background_two_two.x = 1275;
			}
			
			if (background_three_one.x < -2188)
			{
				background_three_one.x = 2188; 
			}
		 
			if(background_three_two.x < -2188)
			{
				background_three_two.x = 2188;
			}
			
			//---------------
			if (background_four_one.x < -1275)
			{
				background_four_one.x = 1275; 
			}
		 
			if(background_four_two.x < -1275)
			{
				background_four_two.x = 1275;
			}
			
			if (background_five_one.x < -1275)
			{
				background_five_one.x = 1275; 
			}
		 
			if(background_five_two.x < -1275)
			{
				background_five_two.x = 1275;
			}
		}
		
		public function moveRight() : void
		{
			background_two_one.x += 0.1;
			background_two_two.x += 0.1;
			
			background_three_one.x += 1;
			background_three_two.x += 1;
			
			background_four_one.x += 0.1;
			background_four_two.x += 0.1;
			background_five_one.x += 2;
			background_five_two.x += 2;
			
			if (background_two_one.x > 1275)
			{
				background_two_one.x = -1275; 
			}
		 
			if(background_two_two.x > 1275)
			{
				background_two_two.x = -1275;
			}
			
			if (background_three_one.x > 2188)
			{
				background_three_one.x = -2188; 
			}
		 
			if(background_three_two.x > 2188)
			{
				background_three_two.x = -2188;
			}
			
			//---------------
			
			if (background_four_one.x > 1275)
			{
				background_four_one.x = -1275; 
			}
		 
			if(background_four_two.x > 1275)
			{
				background_four_two.x = -1275;
			}
			
			if (background_five_one.x > 1275)
			{
				background_five_one.x = -1275; 
			}
		 
			if(background_five_two.x > 1275)
			{
				background_five_two.x = -1275;
			}
			
		}
		public function destroy():void {
			stage.removeChild(background_two_one);
			stage.removeChild(background);
			stage.removeChild(background_two_two);
			stage.removeChild(groundArt);
			stage.removeChild(background_three_one);
			stage.removeChild(background_three_two);
		}
		
	}

}