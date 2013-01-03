package game 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import util.ImageMaker;
	import util.PulsingImage;
	import values.Images;
	import values.Teams;
	import values.Game;
	import net.flashpunk.FP;
	import values.Colors;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Shot extends Entity 
	{
		public static const	WIDTH:Number = 16;
		
		private var _team:String;
		private var _xVel:Number;
		private var _yVel:Number;
		
		public function Shot(team:String, x:Number, y:Number, direction:Number, speed:Number)
		{
			var img:Image = ImageMaker.centeredAndConstrained(Images.SHOT, WIDTH, WIDTH);
			img.color = Colors.SHOT_COLORS[team];
			img.angle = direction;
			
			super(x, y,  new PulsingImage(img, 1, 0.05));
			setHitbox(WIDTH, WIDTH, WIDTH / 2, WIDTH / 2);
			
			_team = team;
			
			_xVel = speed * Math.cos(direction);
			_yVel = speed * Math.sin(direction);
			
			layer = 100;
		}
		
		override public function update():void 
		{
			super.update();
			
			for each (var team:String in Teams.ALL) {
				
				if (team != _team) {
					
					var collidedEntity:Entity = collide(team, x, y);
					
					if (collidedEntity && collidedEntity is Hittable) {
						
						var hittable:Hittable = collidedEntity as Hittable;
						hit(hittable);
						break;
					}
				}
			}
			
			x += _xVel * FP.elapsed;
			y += _yVel * FP.elapsed;
			
			checkOutsideGame();
			
			graphic.update();
		}
		
		private function hit(hittable:Hittable):void {
			
			hittable.hit();
			if (world) world.remove(this);
		}
		
		private function checkOutsideGame():void {
			
			var shouldBeRemoved:Boolean =
				(x + WIDTH < 0)
			||	(y + WIDTH < 0)
			||	(x - WIDTH > Game.WIDTH)
			||	(y - WIDTH > Game.HEIGHT);
			
			if (shouldBeRemoved && world) world.remove(this);
		}
	}

}