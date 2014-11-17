package  
{
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author ... The Hitman
	 */
	public class Background 
	{
		[Embed(source="../lib/PHC.png")]
		private var ArtBackground : Class;
		private var artBackground : Bitmap;
		
		public function Background() 
		{
			
			artBackground = new ArtBackground;
			addChild(artBackground);
			
		}
		
	}

}