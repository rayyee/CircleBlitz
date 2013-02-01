package game.circleblitz 
{
	import ash.core.Engine;
	import ash.core.Entity;
	import game.circleblitz.comps.MouseControl;
	import game.circleblitz.comps.PosMotion;
	import game.circleblitz.comps.Postition;
	import game.circleblitz.comps.stone.CircleStone;
	import game.circleblitz.nodes.MouseControlNode;
	/**
	 * ...
	 * @author rayyee
	 */
	public class EntityCreator 
	{
		private var gameEngine:Engine;
		private var conf:GameConfig;
		
		public function EntityCreator(ge:Engine, config:GameConfig) 
		{
			conf = config;
			gameEngine = ge;
		}
		
		public function destroyEntity(entity:Entity):void
		{
			gameEngine.removeEntity(entity);
		}
		
		public function createStone(tx:Number, c:uint, r:Number = 50):Entity
		{
			var 
			_stone:Entity = new Entity()
			.add(new CircleStone(c, r))
			.add(new Postition(-r, conf.nStoneLineY))
			.add(new PosMotion(tx, conf.nStoneLineY))
			.add(new MouseControl());
			
			gameEngine.addEntity(_stone);
			
			return _stone;
		}
		
	}

}