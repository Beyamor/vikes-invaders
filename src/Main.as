package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Video;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import worlds.GameWorld;
	import values.Game;
	import worlds.TitleScreen;
	import flash.media.Camera;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Main extends Engine 
	{
		public static const	WIDTH:Number	= 800;
		public static const HEIGHT:Number	= 600;
		
		public static var video:Video;
		
		public function Main():void 
		{
			super(Game.WIDTH, Game.HEIGHT);
			
			var camera:Camera = Camera.getCamera();
			video = new Video(600, 600);
			video.attachCamera(camera);
			stage.addChild(video);
			video.visible = false;
			
			FP.world = new TitleScreen;
		}
		
	}
	
}