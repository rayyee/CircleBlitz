package game.circleblitz.unittest.test 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import game.circleblitz.assets.CircleCreator;
	/**
	 * ...
	 * @author rayyee
	 */
	public class CircleAssetsTest extends Sprite 
	{
		
		public function CircleAssetsTest() 
		{
			new CircleCreator().create(this, 20, new Point(100, 100));
		}
		
	}

}