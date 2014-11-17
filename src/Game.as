package  
{
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Game 
	{
		public var _player:Player;
		public var _enemy:Enemy;
		public var _crosshair:Crosshair;
		public function Game() 
		{
			_player = new Player;
			_enemy = new Enemy;
			_crosshair = new Crosshair;
		}
		
	}

}