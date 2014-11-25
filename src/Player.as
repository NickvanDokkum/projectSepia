package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Player extends MovieClip
	{
		private var bulletTimeBool:Boolean = false;

		private var _stage : Stage;

		public var player:MovieClip = new cowboy();
		
		public var animNum:Number;
	
	
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
			check = true;
			if ( check == true)
			{
			
			_stage.removeChild(player);
			player_removed = true;
			}
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
			
			
			
			if (buttonD == true) {
				Main.main._game.moveEverythingRight();
				player.scaleX = -1;
				if (animNum != 2)
				{
				removePlayer();
				setPlayerWalk();
				
				if (animNum == 2)
				{}
				}
			}
			else if (buttonA == true) {
				Main.main._game.moveEverythingLeft();
				player.scaleX = 1;
				if (animNum != 2)
				{
				removePlayer();
				setPlayerWalk();
				
				if (animNum == 2)
				{}
				}
			}
			
			else if(animNum != 1,4)
				{
				removePlayer();
				setPlayerIdle();
				
				if (animNum == 1,4)
				{}
				}
		}
		public function gotHit():void {
			//player death animation here, please
			trace("you just got shot");
			
			if (animNum != 4)
				{
				removePlayer();
				setPlayerDeath();
				if (animNum == 4)
				{
					/*resetPlayerIdle();
					setPlayerShoot();
					setPlayerWalk();*/
				}
				}
		}
		public function bulletTime():void {
			bulletTimeBool = true;
			
		}
		public function bulletTimeOff():void {
			bulletTimeBool = false;
		}
	
}
}