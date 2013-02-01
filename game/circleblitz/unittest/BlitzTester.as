package game.circleblitz.unittest 
{
	import flash.display.Sprite;
	import game.circleblitz.unittest.test.CircleAssetsTest;
	/**
	 * ...
	 * @author rayyee
	 */
	public class BlitzTester extends Sprite
	{
		
		public function BlitzTester() 
		{
			addChild(new CircleAssetsTest());
		}
		
	}

}