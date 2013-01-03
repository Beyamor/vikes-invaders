package game.colorers 
{
	import game.Alien;
	import values.Colors;
	/**
	 * ...
	 * @author beyamor
	 */
	public class AlternatingColorer implements AlienColorer 
	{
		private var _colorIndex:int = 0;
		
		public function color(aliens:Vector.<Alien>):void {
			
			for each (var alien:Alien in aliens) {
				
				alien.color(Colors.ALIENS[_colorIndex % Colors.ALIENS.length]);
				++_colorIndex;
			}
		}
	}

}