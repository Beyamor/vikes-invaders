package game 
{
	import adobe.utils.CustomActions;
	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.events.TimerEvent;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.utils.ByteArray;
	import net.flashpunk.graphics.Image;
	import util.JPGEncoder;
	import util.Timer;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PictureGrabber 
	{
		private var stage:Stage;
		
		public function PictureGrabber()
		{
			this.stage = stage;
		}
		
		public function grab():BitmapData {
			
			var bitmapData:BitmapData = new BitmapData(600, 600);
			bitmapData.draw(Main.video);
			
			return bitmapData;
		}
	}

}