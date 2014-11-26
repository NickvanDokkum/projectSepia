package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Player extends MovieClip
	{
		private var bulletTimeBool:Boolean = false;

		private var _stage : Stage;
		
		
		
		public var main : Main;
		
		public var player:MovieClip = new cowboy();
		
		public var animNum:Number;
		public var playerdead : Boolean;
		private var shootTimer:Timer = new Timer(3000, 1);
		private var menuTimer:Timer = new Timer(3000, 1);
		public var check : Boolean;
		public var player_removed:Boolean;
		public var buttonA:Boolean = false;
		public var buttonD:Boolean = false;
		public function Player(stage : Stage) 
		{
			_stage = stage;
			if (_stage) init();
			else _stage.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		
		private function init(e:Event = null):void 
		{
			_stage.removeEventListener(Event.ADDED_TO_STAGE, init);
			player = new cowboy();
			player.x = 200;
			player.y = 420;
			_stage.addChild(player);
			

			_stage.addEventListener(Event.ENTER_FRAME, updateFunction);
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			_stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		public function onKeyDown(e:KeyboardEvent):void {
			if (e.keyCode == 65) {
				buttonA = true;
			}
			else if (e.keyCode == 68) {
				buttonD = true;
			}
		}
		
		//--------------------------
		public function setPlayerWalk()
		{
			if ( player_removed == true )
			{
				animNum = 2;
				player = new cowboy_walk_01();
				_stage.addChild(player);
				player.scaleX = 1;
				player.x = 200;
				player.y = 420;
			}
			
		
		}
		
		public function setPlayerDeath()
		{
			if ( player_removed == true )
			{
				animNum = 4;
				player = new cowboy_death_01();
				_stage.addChild(player);
				player.scaleX = 1;
				player.x = 200;
				player.y = 420;
			}
		
		}
		
		public function setPlayerShoot()
		{
			if ( player_removed == true )
			{
				animNum = 3;
				player = new cowboy_shoot_01();
				_stage.addChild(player);
				player.scaleX = this.scaleX;
				player.x = 200;
				player.y = 420;
			}
		
		}
		
		public function setPlayerIdle()
		{
			if (buttonD == false)
			{
				animNum = 1;
				
				player = new cowboy();
				_stage.addChild(player);
				
				player.x = 200;
				player.y = 420;
			}
			
		}
		public function removePlayer()
		{
			if (_stage.contains(player)){
				_stage.removeChild(player);
			}
			player_removed = true;
		}
		//---------------------------
		
		public function onKeyUp(e:KeyboardEvent):void {
			if (e.keyCode == 65) {
				buttonA = false;
			}
			else if (e.keyCode == 68) {
				buttonD = false;
			}
		}
		public function updateFunction(e:Event):void {
			if (animNum == 4 && player.currentFrame == player.totalFrames) {
				player.stop();
			}
			if(animNum != 3){
				if (buttonD == true && bulletTimeBool == false) {
					Main.main._game.moveEverythingLeft();
					player.scaleX = 1;
					if (animNum != 2)
					{
						removePlayer();
						setPlayerWalk();
					}
				}
				else if (buttonA == true && bulletTimeBool == false) {
					Main.main._game.moveEverythingRight();
					player.scaleX = -1;
					if (animNum != 2)
					{
						removePlayer();
						setPlayerWalk();
					}
				}
				else if(animNum != 1 && animNum != 4)
				{
					removePlayer();
					setPlayerIdle();
				}
			}
		}
		public function gotHit():void {
			trace("you just got shot");
			bulletTimeBool = true;
			if (animNum != 4)
			{
				menuTimer.addEventListener(TimerEvent.TIMER, timer);
				menuTimer.start();
				removePlayer();
				setPlayerDeath();
				animNum = 4;
				playerdead = true;
				
			}
		}
		public function bulletTime():void {
			bulletTimeBool = true;
			buttonA = false;
			buttonD = false;
		}
		public function bulletTimeOff():void {
			shootTimer.addEventListener(TimerEvent.TIMER, timer);
			shootTimer.start();
			removePlayer();
			setPlayerShoot();
			animNum = 3;
		}
		
		private function timer(e:TimerEvent):void 
		{
			bulletTimeBool = false;
			removePlayer();
			setPlayerIdle();
			animNum = 1;
		}
		private function menutimer(e:TimerEvent):void 
		{
			Main.main.dead = true;
			if (playerdead == true)
			{
				main.dead = true;
				main.addedmenu = false;
				//main.restart();
				trace(main.dead);
				
			}
		}
	}
}