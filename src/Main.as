package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import worlds.GameWorld;
	import values.Game;
	import worlds.TitleScreen;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Main extends Engine 
	{
		public static const	WIDTH:Number	= 800;
		public static const HEIGHT:Number	= 600;
		
		public function Main():void 
		{
			super(Game.WIDTH, Game.HEIGHT);
			
			FP.world = new TitleScreen;
		}
		
	}
	
}