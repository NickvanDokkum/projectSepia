package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import Player;
	import Crosshair;
	import Enemy;
	import Background;
	import EnemyCreator;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Game extends MovieClip
	{
		public var _player:Player;
		public var _enemy:EnemyCreator;
		public var _crosshair:Crosshair;
		public var _background:Background;

		private var enemiesHit:Number = 0;
		private var deathTimer:Timer = new Timer(1000, 1);
		
		public function Game()
		{
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_background = new Background();
			addChild(_background);
			_player = new Player(stage);
			_enemy = new EnemyCreator(stage);
			_crosshair = new Crosshair();
			addChild(_crosshair);
			stage.addEventListener(MouseEvent.CLICK,click);
		}
		
		private function click(e:MouseEvent):void 
		{
			trace("shooting");
			var currentEnemy : Enemy;
			for (var i in _enemy.enemyArray) {
				currentEnemy = _enemy.enemyArray[i];
				if (currentEnemy.hitTestPoint(mouseX, mouseY)) {
					currentEnemy.hit();
				}
			}
		}
		public function startTimer():void {
			deathTimer.addEventListener(TimerEvent.TIMER, timer);
			deathTimer.start();
		}
		public function timer(e:TimerEvent) {
			if (enemiesHit < 3) {
				var currentEnemy : Enemy;
					for (var i in _enemy.enemyArray) {
					currentEnemy = _enemy.enemyArray[i];
					if (currentEnemy.hitTestPoint(mouseX, mouseY)) {
						currentEnemy.shoot();
					}
				}
				_player.gotHit();
				stage.removeEventListener(MouseEvent.CLICK,click);
			}
		}

		

		
	}

}
