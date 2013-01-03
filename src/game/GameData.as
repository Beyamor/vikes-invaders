package game 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameData 
	{
		private var _totalPoints:int		= 0;
		private var _state:String			= "playing";
		private var _playerIsDead:Boolean	= false;
		
		public function setLost():void			{ _state = "lost"; }
		public function setWon():void			{ _state = "won"; }
		public function isLost():Boolean		{ return _state == "lost"; }
		public function isWon():Boolean			{ return _state == "won"; }
		public function startPlaying():void		{ _state = "playing"; }
		
		public function killPlayer():void		{ _playerIsDead = true; }
		public function playerIsDead():Boolean	{ return _playerIsDead; }
		
		public function addPoints(points:int):void {
			
			_totalPoints += points;
		}
		
		public function get points():int {
			
			return _totalPoints;
		}
	}

}