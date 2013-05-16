package game 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import util.ImageMaker;
	import util.Timer;
	import values.Images;
	import values.Game;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import values.Teams;
	import values.Teams;
	import values.Colors;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Player extends Entity implements Hittable 
	{
		private var _shotTimer:Timer;
		private var _isEnabled:Boolean = false;
		private var _data:GameData;
		
		public function Player(data:GameData, x:Number, y:Number, source:*)
		{
			super(x, y);
			_data = data;
			
			var img:Image = ImageMaker.centeredAndConstrained(source, Game.ENTITY_WIDTH + 32, Game.ENTITY_WIDTH + 32);
			img.color = Colors.PLAYER;
			graphic = img;
			setHitbox(Game.ENTITY_WIDTH, Game.ENTITY_WIDTH, Game.ENTITY_WIDTH / 2, Game.ENTITY_WIDTH / 2);
			
			type = Teams.HUMAN;
			
			_shotTimer = new Timer(Game.PLAYER_SHOOT_TIME);
			
			Input.define("left", Key.A, Key.LEFT);
			Input.define("right", Key.D, Key.RIGHT);
			Input.define("shoot", Key.SPACE, Key.W);
		}
		
		override public function update():void 
		{
			super.update();
			
			_shotTimer.update();
			
			
			if (_isEnabled) {
				
				if (Input.check("left"))	FP.stepTowards(this, Game.ENTITY_WIDTH / 2,					y, speed);
				if (Input.check("right"))	FP.stepTowards(this, Game.WIDTH - Game.ENTITY_WIDTH / 2,	y, speed);
				
				if (Input.check("shoot") && canShoot())	shoot();
			}
		}
		
		private function get speed():Number {
			
			return 3;
		}
		
		private function canShoot():Boolean {
			
			return _shotTimer.hasFired();
		}
		
		private function shoot():void {
			
			if (world) world.add(new Shot(Teams.HUMAN, x, y, -Math.PI / 2, Game.PLAYER_SHOT_SPEED));
			_shotTimer.reset();
		}
		
		public function hit():void {
			
			if (world) world.remove(this);
			_data.killPlayer();
		}
		
		public function enable():void	{ _isEnabled = true; }
		public function disable():void	{ _isEnabled = false; }
	}

}