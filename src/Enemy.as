package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Enemy extends MovieClip
	{
		public var enemy:MovieClip = new cowboy();
		public var hitted:Boolean = false;
		public var coordsX:Number;
		public var EnemyAnimNum:Number;
		public var switchNumber:Number;
<<<<<<< HEAD
		public var enemy_removed:Boolean;
=======
		public var markedForDead:Boolean = false;
>>>>>>> origin/master
		
		private var bulletTimeBool:Boolean = false;
		
		public function Enemy() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			enemy = new cowboy();
			addChild(enemy);
			enemy.y = 500;
		}
		//----------------------------------------------
		public function setEnemyShoot()
		{
			if ( enemy_removed == true )
			{
				EnemyAnimNum = 2;
				enemy = new shoot_banditos_01(); 
				_stage.addChild(enemy);
				enemy.scaleX = this.scaleX;
				
			}
		}
		
		public function removeEnemy()
		{
			if (_stage.contains(enemy)){
				_stage.removeChild(enemy);
			}
			enemy_removed = true;
		}
		//----------------------------------------------
		public function hit():void {
			markedForDead = true;
		}
		public function death():void {
			hitted = true;
			// change movieclip to got hit animation, please
			trace("aarg");
		}
		public function shoot():void {
			if (hitted == false) {
				trace("bang bang");
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
				// elke derde is dezelfde
				case(1):
					enemy.x = stage.stageWidth + enemy.width / 2;
				break;
				case(2):
					enemy.x = stage.stageWidth + enemy.width * 1.5;
				break;
				case(3):
					enemy.x = stage.stageWidth + enemy.width * 2.5;
				break;
				case(4):
					enemy.x = stage.stageWidth * 1.5 + enemy.width * 1;
				break;
				case(5):
					enemy.x = stage.stageWidth * 1.5 + enemy.width * 2;
				break;
				case(6):
					enemy.x = stage.stageWidth * 1.5 + enemy.width * 3;
				break;
				case(7):
					enemy.x = stage.stageWidth * 1.5 + enemy.width * 4;
				break;
				case(8):
					enemy.x = stage.stageWidth * 1.5 + enemy.width * 5;
				break;
				case(9):
					enemy.x = stage.stageWidth * 1.5 + enemy.width * 6;
				break;
				case(10):
					enemy.x = stage.stageWidth * 1.5 + enemy.width * 7;
				break;
				case(11):
					enemy.x = stage.stageWidth * 1.5 + enemy.width * 8;
				break;
				case(12):
					enemy.x = stage.stageWidth * 1.5 + enemy.width * 9;
				break;
				default:
					trace("enemy coords failed");
				break;
			}
			
		}
	}
}