package game.circleblitz
{
	import ash.core.Engine;
	import ash.tick.FrameTickProvider;
	import flash.display.Sprite;
	import game.circleblitz.assets.CircleCreator;
	import game.circleblitz.effect.StoneBeat;
	import game.circleblitz.render.RenderSystem;
	import game.circleblitz.uc.DragStoneSystem;
	import game.circleblitz.uc.MouseC;
	
	/**
	 * ...
	 * @author rayyee
	 */
	public class CircleBlitz extends Sprite
	{
		
		public function CircleBlitz()
		{
			stage.scaleMode = "noScale";
			mouseChildren = false;
			
			var mousecontrol:MouseC = new MouseC(stage);
			var engine:Engine = new Engine();
			var config:GameConfig = new GameConfig();
			var creator:EntityCreator = new EntityCreator(engine, config);
			
			var _lineLayer:Sprite = getLayer();
			var _stoneLayer:Sprite = getLayer();
			_lineLayer.graphics.beginFill(0x333333);
			_lineLayer.graphics.drawRect(0, config.nStoneLineY, config.nWidth, 10);
			
			engine.addSystem(new RenderSystem(_stoneLayer, new CircleCreator, creator), 0);
			engine.addSystem(new StoneBeat(config, creator), 3);
			engine.addSystem(new DragStoneSystem(mousecontrol, config, creator), 1);
			
			for (var i:int = 8, count:int = 0; i >= 0; i -= 1)
			{
				creator.createStone(i * 100, Math.random() * 0xffffff);
			}
			
			var tickProvider:FrameTickProvider = new FrameTickProvider(this);
			tickProvider.add(engine.update);
			tickProvider.start();
		}
		
		private function getLayer():Sprite
		{
			var _layer:Sprite = new Sprite();
			addChild(_layer);
			return _layer;
		}
	
	}

}