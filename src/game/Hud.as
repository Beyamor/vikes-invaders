package game 
{
	import flash.events.TextEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Draw;
	import values.Game;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Hud extends Entity 
	{
		private var _data:GameData;
		private var _pointsDisplay:Text;
		private var _endStateDisplay:Text;
		
		public function Hud(data:GameData) 
		{			
			_data = data;
			_pointsDisplay		= new Text("999", 10, 10);
			_endStateDisplay	= new Text("", Game.WIDTH / 2, Game.HEIGHT / 2, 150, 30); // fuck yeah magic numbers
			
			var displayList:Graphiclist = new Graphiclist;
			displayList.add(_pointsDisplay);
			displayList.add(_endStateDisplay);
			graphic = displayList;
			
			display();
		}
		
		override public function update():void 
		{
			super.update();
			
			display();
		}
		
		private function display():void {
			
			displayPoints();
			displayEndState();
		}
		
		private function displayPoints():void {
			
			_pointsDisplay.text = _data.points.toString();
		}
		
		private function displayEndState():void {
			
			if (_data.isWon() || _data.isLost()) {
				
				_endStateDisplay.visible = true;
				_endStateDisplay.text = (_data.isWon()? "Won" : "Lost") + "\n(press space)";
				_endStateDisplay.centerOrigin();
			}
			
			else {
				
				_endStateDisplay.visible = false;
			}
		}
		
		override public function render():void 
		{
			super.render();
			
			Draw.linePlus(0, Game.ALIEN_WIN_HEIGHT, Game.WIDTH, Game.ALIEN_WIN_HEIGHT, 0xFFFFFF, 0.5, 2);
		}
	}

}