package game.circleblitz.render 
{
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;
	import flash.display.Sprite;
	import game.circleblitz.assets.CircleCreator;
	import game.circleblitz.EntityCreator;
	import game.circleblitz.nodes.RenderStoneNode;
	
	/**
	 * ...
	 * @author rayyee
	 */
	public class RenderSystem extends System 
	{
		private var nodes:NodeList;
		private var container:Sprite;
		private var circleC:CircleCreator;
		private var nodeSet:Array;
		private var entityC:EntityCreator;
		
		public function RenderSystem(c:Sprite, circlec:CircleCreator, entityc:EntityCreator) 
		{
			entityC = entityc;
			nodeSet = [];
			circleC = circlec;
			container = c;
		}
		
		override public function addToEngine(engine:Engine):void
		{
			nodes = engine.getNodeList(RenderStoneNode);
			nodes.nodeAdded.add(nodeAdded);
			nodes.nodeRemoved.add(nodeRemoved);
		}
		
		private function nodeAdded(node:RenderStoneNode):void
		{
			nodeSet.push(node);
		}
		
		private function nodeRemoved(node:RenderStoneNode):void
		{
			nodeSet.splice(nodeSet.indexOf(node), 1);
			if (nodeSet.length < 8)
			{
				entityC.createStone(-100, Math.random() * 0xffffff);
			}
		}
		
		override public function update(time:Number):void
		{
			container.graphics.clear();
			var node:RenderStoneNode;
			for (node = nodes.head; node; node = node.next)
			{
				circleC.create(container, node.circlestone.radius, node.circlestone.color, node.postition.x, node.postition.y);
			}
		}
		
	}

}