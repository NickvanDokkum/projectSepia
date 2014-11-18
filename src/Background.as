package  
{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author ... The Hitman
	 */
	public class Background extends MovieClip
	{
		[Embed(source="../lib/background_sepia_01.jpg")]
		//private var ArtBackground : Class;
		private var artBackground : MovieClip;
		
		public function Background() 
		{
			
			artBackground = new ArtBackground;
			stage.addChild(artBackground);
			
		}
		
	}

}