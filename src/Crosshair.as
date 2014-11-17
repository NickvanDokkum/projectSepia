package  
{
	
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Crosshair extends Sprite
	{
		[Embed(source="../lib/PHC.png")]
		private var ArtCrosshair : Class;
		private var artCrosshair : Bitmap;
		public function Crosshair() 
		{
			artCrosshair = new ArtCrosshair;
			addChild(artCrosshair);
		}
		
	}

}