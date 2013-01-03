package game.spawners 
{
	import game.Alien;
	import values.Game;
	/**
	 * ...
	 * @author beyamor
	 */
	public class GridSpawner implements AlienSpawner 
	{
		private var _horizontal:int;
		private var _vertical:int;
		
		public function GridSpawner(numberHorizontally:int, numberVertically:int)
		{
			_horizontal = numberHorizontally;
			_vertical = numberVertically;
		}
		
		public function spawn():Vector.<Alien> {
			
			var aliens:Vector.<Alien> = new Vector.<Alien>;
			
			var spaceBetweenAliens:Number	= Game.ENTITY_WIDTH + 10; // or whatever
			var startX:Number				= (_horizontal - 1) * spaceBetweenAliens / 2;
			var startY:Number				= Game.ALIEN_START_HEIGHT - _vertical * spaceBetweenAliens;
			
			for (var i:int = 0; i < _horizontal; ++i) {
				for (var j:int = 0; j < _vertical; ++j) {
					
					var x:Number = startX + spaceBetweenAliens * i;
					var y:Number = startY + spaceBetweenAliens * j;
					
					aliens.push(new Alien(x, y));
				}
			}
			
			return aliens;
		}
	}

}