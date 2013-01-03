package game.directors 
{
	import game.Alien;
	import values.Game;
	import net.flashpunk.FP;
	import worlds.GameWorld;
	/**
	 * ...
	 * @author beyamor
	 */
	public class CyclicDirector extends AlienDirector 
	{		
		public function CyclicDirector(world:GameWorld) { super(world); }
		
		override public function update():void {
			
			super.update();
			
			for each (var alien:Alien in aliens) {
				
				alien.x = (alien.x + speed() * FP.elapsed) % Game.WIDTH;
			}
		}
	}

}