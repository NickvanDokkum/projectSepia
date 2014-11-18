package  
{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author ... The Hitman
	 */
	public class Background extends Sprite
	{
		[Embed(source = "../lib/background_sepia_01.jpg")]
		private var bgArt:Class;
		public var background : Bitmap;
		
		public function Background() 
		{
			
			background = new bgArt;
			stage.addChild(background);
			
		}
		
	}

}