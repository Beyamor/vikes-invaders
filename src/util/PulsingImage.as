package util 
{
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PulsingImage extends Graphic 
	{
		private var _baseImage:Image;
		private var _pulseRate:Number;
		private var _maxPulsePercent:Number;
		private var _elapsed:Number = 0;
		
		public function PulsingImage(baseImage:Image, pulseRate:Number=1, maxPulsePercent:Number=0)
		{
			_baseImage			= baseImage;
			_pulseRate			= pulseRate;
			_maxPulsePercent	= maxPulsePercent;
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			var pulsePercent:Number = 1 + Math.sin(2 * Math.PI * _pulseRate * _elapsed) * _maxPulsePercent;
			
			_baseImage.scale *= pulsePercent;
			_baseImage.originX *= pulsePercent;
			_baseImage.originY *= pulsePercent;
			
			_baseImage.render(target, point, camera);
			
			_baseImage.scale /= pulsePercent;
			_baseImage.originX /= pulsePercent;
			_baseImage.originY /= pulsePercent;
		}
		
		// Ugh why isn't this just called what the hey
		// Whatever I guess. TODO: see if this can be moved into render
		override public function update():void 
		{			
			super.update();
			
			_elapsed += FP.elapsed;
		}
	}

}