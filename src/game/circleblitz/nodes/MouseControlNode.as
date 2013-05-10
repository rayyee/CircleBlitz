package game.circleblitz.nodes 
{
	import ash.core.Node;
	import game.circleblitz.comps.MouseControl;
	import game.circleblitz.comps.PosMotion;
	import game.circleblitz.comps.Postition;
	import game.circleblitz.comps.stone.CircleStone;
	/**
	 * ...
	 * @author rayyee
	 */
	public class MouseControlNode extends Node
	{
		public var mousec:MouseControl;
		public var pos:Postition;
		public var stone:CircleStone;
		public var posMotion:PosMotion;
		
		public function MouseControlNode() 
		{
			
		}
		
	}

}