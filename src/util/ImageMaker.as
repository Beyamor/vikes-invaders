package util 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author beyamor
	 */
	public class ImageMaker 
	{
		public static function centeredAndConstrained(source:*, width:Number, height:Number):Image {
			
			var image:Image = new Image(source);
			
			image.scaleX = width / image.width;
			image.scaleY = height / image.height;
			image.x = -image.scaledWidth/2;
			image.y = -image.scaledHeight / 2;
			
			return image;
		}
	}

}