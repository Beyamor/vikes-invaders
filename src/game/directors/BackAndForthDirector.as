package game.directors 
{
	import game.Alien;
	import net.flashpunk.FP;
	import util.Timer;
	import values.Game;
	import util.EntityQueries;
	import worlds.GameWorld;
	/**
	 * ...
	 * @author beyamor
	 */
	public class BackAndForthDirector extends AlienDirector 
	{		
		private var _movingRight:Boolean;
		private var _movingDown:Boolean;
		private var _amountMovedDown:Number;
		
		public function BackAndForthDirector(world:GameWorld) { super(world); }
		
		override public function resetState():void 
		{
			super.resetState();
			
			_movingDown = false;
			_movingRight = true;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (aliensExist()) {
				
				if (directionShouldBeChanged()) {
					
					changeDirection();
					startMovingDown();
				}
				
				else if (isMovingDown()) {
					
					continueMovingDown();
				}
				
				else {
				
					moveSideways();
				}
			}
		}
		
		private function moveSideways():void {
			
			var delta:Number = speed() * FP.elapsed * (_movingRight? 1 : -1);
			
			for each (var alien:Alien in aliens) {
				
				alien.x += delta;
			}
		}
		
		private function directionShouldBeChanged():Boolean {
			
			if (_movingRight) {
				
				return EntityQueries.maxX(aliens) >= Game.WIDTH - Game.ENTITY_WIDTH / 2;
			}
			
			else {
				
				return EntityQueries.minX(aliens) <= Game.ENTITY_WIDTH / 2;
			}
		}
		
		private function changeDirection():void {
			
			_movingRight = !_movingRight;
		}
		
		private function isMovingDown():Boolean {
			
			return _movingDown;
		}
		
		private function startMovingDown():void {
			
			_movingDown = true;
			_amountMovedDown = 0;
		}
		
		private function continueMovingDown():void {
			
			var amountToMove:Number = speed() * FP.elapsed;
			
			for each (var alien:Alien in aliens) {
				
				alien.y += amountToMove;
			}
			
			_amountMovedDown += amountToMove;
			if (_amountMovedDown >= Game.DOWNWARD_STEP) stopMovingDown();
		}
		
		private function stopMovingDown():void {
			
			_movingDown = false;
		}
	}

}