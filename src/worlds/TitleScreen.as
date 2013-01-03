package worlds 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class TitleScreen extends World 
	{
		
		public function TitleScreen() 
		{
			var text:Text = new Text("Vikes Invaders - Press space to play");
			var entity:Entity = new Entity(10, 10);
			entity.graphic = text;
			add(entity);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Key.SPACE)) FP.world = new GameWorld();
		}
	}

}