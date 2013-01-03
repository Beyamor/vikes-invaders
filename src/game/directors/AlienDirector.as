package game.directors 
{
	import game.Alien;
	import values.Game;
	import values.Teams;
	import worlds.GameWorld;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class AlienDirector 
	{
		private var _world:GameWorld;
		
		public function AlienDirector(world:GameWorld) {
			
			_world = world;
		}
		
		public function resetState():void {
			
			// I dunno man
		}
		
		public function update():void {
			
		}
		
		protected function speed():Number {
			
			return Game.BASE_ALIEN_SPEED;
		}
		
		public function get aliens():Vector.<Alien> {
			
			var aliens:Vector.<Alien> = new Vector.<Alien>;
			_world.getType(Teams.ALIEN, aliens);
			return aliens;
		}
		
		protected function aliensExist():Boolean { return aliens.length > 0; }
	}
	
}