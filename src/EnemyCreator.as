package  
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class EnemyCreator extends EventDispatcher
	{
		public var enemyArray:Array;
		
		private var _stage : Stage;
		
		public function EnemyCreator(stage : Stage) 
		{
			_stage = stage;
			if (_stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			enemyArray = [];
			createWave();
			_stage.addEventListener(Event.ENTER_FRAME, updateFunction);
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function updateFunction(e:Event):void 
		{
			if (Main.main._game.aliveEnemies == false) {
				createWave();
			}
		}
		public function createWave():void 
		{
			Main.main._game.aliveEnemies = true;
			for (var i:Number = 0; i < 3; i++) {
				var enemy:Enemy = new Enemy();
				_stage.addChild(enemy);
				enemyArray.push(enemy);
				enemy.switchNumber = i + 1;
				enemy.coords();
			}
		}
	}
}