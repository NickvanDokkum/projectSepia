package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
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
		public var hitted:Boolean = false;
		public var coordsX:Number;
		public var switchNumber:Number;
		
		private var bulletTimeBool:Boolean = false;
		
		public function Enemy() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			enemy = new enemyArt();
			addChild(enemy);
			enemy.y = 500;
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
			coordsX = enemy.x;
		}
		public function moveRight():void {
			enemy.x += 5;
			coordsX = enemy.x;
		}
		public function coords():void {
			switch(switchNumber) { 
				
				case(1):
					enemy.x = stage.stageWidth + enemy.width * switchNumber;
				break;
				case(2):
					enemy.x = stage.stageWidth + enemy.width * switchNumber;
				break;
				case(3):
					enemy.x = stage.stageWidth + enemy.width * switchNumber;
				break;
				default:
					trace("enemy coords failed");
				break;
			}
			
		}
	}
}