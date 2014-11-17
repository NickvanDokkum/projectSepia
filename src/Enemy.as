package  
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Enemy extends Sprite
	{
		[Embed(source="../lib/PHEH.png")]
		private var ArtEnemy : Class;
		private var artEnemy : Bitmap;
		
		public function Enemy() 
		{
			
			artEnemy = new ArtEnemy;
			Main.main.addChild(artEnemy);
			
			
		}
		
	}

}