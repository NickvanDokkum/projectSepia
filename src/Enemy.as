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
		public var enemy:MovieClip = new idle_banditos_01();
		public var hitted:Boolean = false;
		public var coordsX:Number;
		public var enemyAnimNum:Number;
		public var switchNumber:Number;
		public var player:Player;

		public var enemy_removed:Boolean;

		public var markedForDead:Boolean = false;

		
		private var bulletTimeBool:Boolean = false;
		
		public function Enemy() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			enemy = new _banditos_01();
			addChild(enemy);
			enemy.y = 435;
			enemy.scaleX = 0.8;
			enemy.scaleY = 0.5;
		}
		//----------------------------------------------
		public function setEnemyShoot():void
		{
			if ( enemy_removed == true )
			{
				enemyAnimNum = 2;
				enemy = new shoot_banditos_01(); 
				addChild(enemy);
				enemy.y = 445;
				//enemy.x = this;
				enemy.scaleX = -0.8;
				enemy.scaleY = 0.5;
				enemy.x = coordsX;
				stage.addEventListener(Event.ENTER_FRAME,updateFunction);
				
			}
		}
		public function setEnemyDeath():void
		{
			if ( enemy_removed == true )
			{
				enemyAnimNum = 3;
				enemy = new death_banditos_01(); 
				addChild(enemy);
				enemy.y = 445;
				enemy.x = coordsX;
				stage.addEventListener(Event.ENTER_FRAME,updateFunction);
				enemy.scaleX = -0.5;
				enemy.scaleY = 0.5;
				
			}
		}
		
		public function removeEnemy():void
		{
			if (enemy){
				removeChild(enemy);
			}
			enemy_removed = true;
		}
		
		public function updateFunction(e:Event):void
		{
			if (enemy.currentframe > enemy.totalframes - 2) {
					stage.removeEventListener(Event.ENTER_FRAME,updateFunction);
					enemy.stop();
				}
				else {
					removeEnemy();
					// VERANDER HIER NAAR IDLE
					enemy = new idle_banditos_01(); 
				}
			}
		}
		//----------------------------------------------
		public function hit():void {
			markedForDead = true;
		}
		public function death():void {
			hitted = true;
			// change movieclip to got hit animation, please
			if (enemyAnimNum != 3)
					{
						
						removeEnemy();
						setEnemyDeath();
					
					}
			trace("aarg");
		}
		public function shoot():void {
			if (hitted == false) {
				trace("bang bang");
				// change movieclip to shoot animation, please
				if (enemyAnimNum != 2)
					{
						removeEnemy();
						setEnemyShoot();
					}
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
