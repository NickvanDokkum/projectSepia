package  
{
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Player extends Sprite
	{
		[Embed(source="../lib/PHAP.png")]
		private var ArtPlayer : Class;
		private var artPlayer : Bitmap;
		
		public function Player() 
		{
			
			artPlayer = new ArtPlayer;
			addChild(artPlayer);
			
		}
		
	}

}