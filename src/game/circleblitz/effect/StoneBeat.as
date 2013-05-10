package game.circleblitz.effect 
{
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;
	import game.circleblitz.EntityCreator;
	import game.circleblitz.GameConfig;
	import game.circleblitz.nodes.RenderStoneNode;
	
	/**
	 * 宝石跳动的往前走
	 * @author rayyee
	 */
	public class StoneBeat extends System 
	{
		private var nodes:NodeList;
		private var _gameConfig:GameConfig;
		private var entityC:EntityCreator;
		public function StoneBeat(conf:GameConfig, entityc:EntityCreator) 
		{
			_gameConfig = conf;
			entityC = entityc;
		}
		
		override public function addToEngine(engine:Engine):void
		{
			nodes = engine.getNodeList(RenderStoneNode);
		}
		
		override public function update(time:Number):void
		{
			var node:RenderStoneNode;
			var tRDist:Number;
			var tPosXDist:Number;
			//trace("start:::::");
			for (node = nodes.head; node; node = node.next)
			{
				//trace(node.postition.x);
					
				tPosXDist = node.posmotion.tx - node.postition.x;
				if (Math.abs(tPosXDist) > 1)
					node.postition.x += tPosXDist * .2;
				else if (node.previous)
					node.posmotion.tx = node.previous.posmotion.tx - 100;
				else if (node.postition.x < _gameConfig.nWidth + node.circlestone.radius)
					node.posmotion.tx += 20;
				else
					entityC.destroyEntity(node.entity);
					//node.posmotion.tx = -node.circlestone.radius;
					
				//radius beat
				tRDist = node.circlestone.tRadius - node.circlestone.radius;
				if (Math.abs(tRDist) > 1)
					node.circlestone.radius += tRDist * .2;
				else
					node.circlestone.tRadius = Math.random() * (_gameConfig.MAX_STONE_RADIUS - 20) + 20 >> 0;
			}
			//trace("end:::::");
		}
		
	}

}