package game.spawners 
{
	import game.Alien;
	import values.Game;
	/**
	 * ...
	 * @author beyamor
	 */
	public class SingleSpawner implements AlienSpawner 
	{		
		public function spawn():Vector.<Alien> {
			
			var aliens:Vector.<Alien> = new Vector.<Alien>;
			
			aliens.push(new Alien(Game.WIDTH / 2, Game.HEIGHT / 2));
			
			return aliens;
		}
	}

}