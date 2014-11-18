package  
{


	import flash.display.MovieClip;
	import flash.events.Event;

	import flash.display.Sprite;
	import flash.display.Bitmap;

	/**
	 * ...
	 * @author Nick van Dokkum
	 */

	public class Enemy extends MovieClip



	{
		[Embed(source="../lib/chara_design.jpg")]
		private var enemyArt:Class;
		private var enemy:Bitmap;
		private var hitted:Boolean = false;
		
		
		public function Enemy() 
		{

			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			enemy = new enemyArt();
			enemy.x = 300;
			enemy.y = 300;
			addChild(enemy);
		}
		public function hit():void {
			if (hitted == false) {
				// change movieclip to got hit animation, please
				hitted = true;
				if (enemy.scaleX == 1) {
					enemy.scaleX = 0.9;
				}
				if (enemy.scaleY == 1) {
					enemy.scaleY = 0.9;
				}
			}
		}
		public function shoot():void {
			if(hitted == false) {
				// change movieclip to shoot animation, please
			}

			
		
			
			

		}
	}
}