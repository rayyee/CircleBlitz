package game.circleblitz.render 
{
	import ash.core.NodeList;
	import ash.core.System;
	import net.richardlord.asteroids.nodes.RenderNode;
	/**
	 * ...
	 * @author rayyee
	 */
	public class GameSystem extends System
	{
		private var nodes:NodeList;
		public function GameSystem() 
		{
			
		}
		
		override public function addToEngine(engine:Engine):void
		{
			
		}
		
		override public function update(time:Number):void
		{
			var node:RenderNode;
			for (node = nodes.head; node; node = node.next)
			{
				
			}
		}
		
	}

}