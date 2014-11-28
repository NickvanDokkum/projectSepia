package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.text.TextField;
	import flash.media.Sound;
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
		private var bulletTimeOn:Boolean = false;
		public var aliveEnemies:Boolean = false;
		public var score:Number = 0;
		private var scoreTxt:TextField;
		private var effectMov:MovieClip = new effect;

		private var enemiesHit:Number = 0;
		private var deathTimer:Timer = new Timer(2000, 1);
		
		public function Game()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			effectMov = new effect;
			effectMov.scaleX = 3.3;
			effectMov.scaleY = 3;
			_background = new Background();
			addChild(_background);
			_player = new Player(stage);
			_enemy = new EnemyCreator(stage);
			_crosshair = new Crosshair();
			addChild(_crosshair);
			scoreTxt = new TextField();
			scoreTxt.text = "Waves cleared: " + score.toString();
			scoreTxt.scaleX = 2;
			scoreTxt.scaleY = 2;
			scoreTxt.x = stage.stageWidth - scoreTxt.width;
			stage.addChild(scoreTxt);
			stage.addChild(effectMov);
			stage.addEventListener(MouseEvent.CLICK, click);
		}
		private function click(e:MouseEvent):void 
		{
			var currentEnemy : Enemy;
			if (bulletTimeOn == true) {
				for (var i in _enemy.enemyArray) {
					currentEnemy = _enemy.enemyArray[i];
					if (currentEnemy.hitTestPoint(mouseX, mouseY)) {
						enemiesHit ++;
						currentEnemy.hit();
					}
				}
			}
		}
		public function startTimer():void {
			deathTimer.addEventListener(TimerEvent.TIMER, timer);
			deathTimer.start();
			_player.bulletTime();
			bulletTimeOn = true;
		}
		public function timer(e:TimerEvent) {
			if (enemiesHit < 3) {
				var currentEnemy : Enemy;
				for (var i in _enemy.enemyArray) {
					currentEnemy = _enemy.enemyArray[i];
					if (currentEnemy.hitted == false) {
						currentEnemy.shoot();
					}
					else {
						currentEnemy.death();
					}
				}
				_player.gotHit();
				stage.removeEventListener(MouseEvent.CLICK, click);
			}
			else {
				var currentEnemy : Enemy;
				for (var i in _enemy.enemyArray) {
					currentEnemy = _enemy.enemyArray[i];
					if (currentEnemy.markedForDead == true && currentEnemy.hitted == false) {
						currentEnemy.death();
					}
				}
				aliveEnemies = false;
				_player.bulletTimeOff();
				bulletTimeOn = false;
				score ++;
				scoreTxt.text = "Waves cleared: " + score.toString();
				enemiesHit = 0;
				deathTimer = new Timer(2000 - score * 50, 1);
			}
		}
		public function moveEverythingLeft():void {
			var currentEnemyLeft : Enemy;
			for (var i in _enemy.enemyArray) {
				currentEnemyLeft = _enemy.enemyArray[i];
				currentEnemyLeft.moveLeft();
				if (currentEnemyLeft.coordsX < 1000 && currentEnemyLeft.hitted == false) {
					startTimer();
					_player.buttonD = false;
				}
			}
			_background.moveLeft();
		}
		public function moveEverythingRight():void {
			var currentEnemyRight : Enemy;
			for (var i in _enemy.enemyArray) {
				currentEnemyRight = _enemy.enemyArray[i];
				currentEnemyRight.moveRight();
			}
			_background.moveRight();
		}
		public function destroy (): void
		{
			_background.destroy();
			removeChild(_background);
			_crosshair.destroy();
			removeChild(_crosshair);
			_enemy.destroy();
			stage.removeChild(effectMov);
			stage.removeChild(scoreTxt);
			Main.main.destroyGame();
		}
	}
}
