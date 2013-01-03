package game.spawners 
{
	import game.Alien;
	import values.Game;
	/**
	 * ...
	 * @author beyamor
	 */
	public class ColumnSpawner implements AlienSpawner 
	{
		private var _numberToSpawn:int;
		
		public function ColumnSpawner(numberToSpawn:int) {
			
			_numberToSpawn = numberToSpawn;
		}
		
		public function spawn():Vector.<Alien> {
			
			var aliens:Vector.<Alien> = new Vector.<Alien>;
			
			for (var i:int = 0; i < _numberToSpawn; ++i) {
				
				aliens.push(
					new Alien(
						Game.WIDTH / 2,
						40 + i * 70
				));
			}
			
			return aliens;
		}
	}

}