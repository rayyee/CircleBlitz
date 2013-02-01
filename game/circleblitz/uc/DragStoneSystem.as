package game.circleblitz.uc 
{
	
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;
	import game.circleblitz.EntityCreator;
	import game.circleblitz.GameConfig;
	import game.circleblitz.nodes.MouseControlNode;
	
	/**
	 * 拖拽宝石
	 * @author rayyee
	 */
	public class DragStoneSystem extends System
	{
		private var mouseC:MouseC;
		private var nodes:NodeList;
		private var conf:GameConfig;
		private var creator:EntityCreator;
		public function DragStoneSystem(mousec:MouseC, config:GameConfig, creat:EntityCreator) 
		{
			creator = creat;
			conf = config;
			mouseC = mousec;
		}
		
		override public function addToEngine(engine:Engine):void
		{
			nodes = engine.getNodeList(MouseControlNode);
		}
		
		override public function update(time:Number):void
		{
			var tPosYDist:Number;
			var node:MouseControlNode;
			for (node = nodes.head; node; node = node.next)
			{
				if (!mouseC.isDowned)
				{
					node.mousec.isDrag = false;
				}
				else
				{
					if (node.mousec.mouseEnabled
					&& node.pos.x - node.stone.radius < mouseC.x
					&& node.pos.x + node.stone.radius > mouseC.x
					&& node.pos.y - node.stone.radius < mouseC.y
					&& node.pos.y + node.stone.radius > mouseC.y)
					{
						node.mousec.isDrag = true;
					}
				}
				if (!node.mousec.isDrag)
				{
					node.posMotion.ty = conf.nStoneLineY;
					
					tPosYDist = node.posMotion.ty - node.pos.y;
					if (Math.abs(tPosYDist) > 1)
						node.pos.y += tPosYDist * .2;
					else
						node.pos.y = node.posMotion.ty;
					
				}
				else
				{
					node.pos.y = mouseC.y;
					if (node.pos.y > conf.nStoneLineY + 200 || node.pos.y < conf.nStoneLineY - 200)
					{
						creator.destroyEntity(node.entity);
					}
				}
			}
		}
		
	}

}