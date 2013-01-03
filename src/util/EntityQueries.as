package util 
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author beyamor
	 */
	public class EntityQueries 
	{
		private static function reduceOverAttr(f:Function, init:*, attr:String, ents:*):* {
			
			var result:* = init;
			
			for each (var ent:Entity in ents) {
				
				result = f.call(null, result, ent[attr]);
			}
			
			return result;
		}
		
		public static function minX(ents:*):Number { return reduceOverAttr(Math.min, Infinity, "x", ents); }
		public static function maxX(ents:*):Number { return reduceOverAttr(Math.max, -Infinity, "x", ents); }
		public static function minY(ents:*):Number { return reduceOverAttr(Math.min, Infinity, "y", ents); }
		public static function maxY(ents:*):Number { return reduceOverAttr(Math.max, -Infinity, "y", ents); }
	}

}