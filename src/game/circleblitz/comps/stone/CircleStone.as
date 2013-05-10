package game.circleblitz.comps.stone 
{
	/**
	 * ...
	 * @author rayyee
	 */
	public class CircleStone 
	{
		
		public var color:uint;		
		public var radius:Number;
		public var tRadius:Number;
		
		public function CircleStone(c:uint = 0x226622, r:Number = 50)
		{
			color = c;
			tRadius = radius = r;
		}
		
	}

}