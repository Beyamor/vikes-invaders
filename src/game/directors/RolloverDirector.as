package game.directors 
{
	import game.Alien;
	import values.Game;
	import worlds.GameWorld;
	/**
	 * ...
	 * @author beyamor
	 */
	public class RolloverDirector extends AlienDirector 
	{
		private var _baseDirector:AlienDirector;
		private function get baseDirector():AlienDirector { return _baseDirector; }
		
		public function RolloverDirector(world:GameWorld, baseDirector:AlienDirector) { 
			
			super(world);
			
			_baseDirector = baseDirector;
		}
		
		override public function update():void 
		{
			super.update();
			
			_baseDirector.update();
			
			for each (var alien:Alien in aliens) {
				
				if (alien.y > Game.HEIGHT) {
					
					alien.y = -Game.ENTITY_WIDTH;
				}
			}
		}
	}

}