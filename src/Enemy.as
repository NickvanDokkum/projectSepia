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
		private var bulletTimeBool:Boolean = false;
		
		public function Enemy() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(Event.ENTER_FRAME, updateFunction);
			enemy = new enemyArt();
			enemy.x = 300;
			enemy.y = 300;
			addChild(enemy);
		}
		
		private function updateFunction(e:Event):void 
		{
			if (bulletTime == false && hitted == false) {
				if (enemy.x < 700) {
					Main.main._game.bulletTime();
				}
			}
		}
		public function hit():void {
			if (hitted == false) {
				stage.removeEventListener(Event.ENTER_FRAME, updateFunction);
				// change movieclip to got hit animation, please
				hitted = true;
				if (enemy.scaleX == 1) {
					enemy.scaleX = 0.9;
				}
				if (enemy.scaleY == 1) {
					enemy.scaleY = 0.9;
				}
			}
			else {
				trace("ik ben al dood, lul");
			}
		}
		public function shoot():void {
			if(hitted == false) {
				// change movieclip to shoot animation, please
			}
		}
		public function bulletTime():void {
			bulletTimeBool = true;
		}
		public function moveLeft():void {
			enemy.x -= 5;
		}
		public function moveRight():void {
			enemy.x += 5;
		}
	}
}