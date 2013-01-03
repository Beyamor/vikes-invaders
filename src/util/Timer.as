package util 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Timer 
	{
		private var period:Number;
		private var elapsed:Number;
		
		public function Timer(period:Number)
		{
			this.period = period;
			this.elapsed = 0;
		}
		
		public function reset():void {
			
			this.elapsed = 0;
		}
		
		public function start():void {
			
			reset();
		}
		
		public function hasFired():Boolean {
			
			return elapsed >= period;
		}
		
		public function update():void {
			
			elapsed += FP.elapsed;
		}
		
		public function percentElapsed():Number
		{
			return Math.min(elapsed / period, 1);
		}
		
	}

}