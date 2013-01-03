package game 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import values.Images;
	import util.ImageMaker;
	import values.Game;
	import values.Teams;
	import worlds.GameWorld;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Alien extends Entity implements Hittable
	{
		private var _img:Image;
		
		public function Alien(x:Number, y:Number)
		{
			super(x, y);
			
			_img = ImageMaker.centeredAndConstrained(Images.ALIEN, Game.ENTITY_WIDTH, Game.ENTITY_WIDTH);
			graphic = _img;
			setHitbox(Game.ENTITY_WIDTH, Game.ENTITY_WIDTH, Game.ENTITY_WIDTH / 2, Game.ENTITY_WIDTH / 2);
			
			type = Teams.ALIEN;
		}
		
		public function hit():void {
			
			if (world && world is GameWorld) {
			
				var gameWorld:GameWorld = world as GameWorld;
				gameWorld.data.addPoints(pointValue());
			}
			
			if (world) world.remove(this);
		}
		
		public function pointValue():int {
			
			return 10; // or whatever
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Math.random() > 0.9995) {
				
				if (world) world.add(new Shot(Teams.ALIEN, x, y, Math.PI/2, Game.ALIEN_SHOT_SPEED));
			}
		}
		
		public function color(color:uint):void { _img.color = color; }
	}

}