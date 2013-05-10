package game.circleblitz.assets 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author rayyee
	 */
	public class CircleCreator 
	{
		
		public function CircleCreator() 
		{
			
		}
		
		public function create(c:Sprite, radius:Number, color:uint, posX:Number, posY:Number):void 
		{
			var 
			g:Graphics = c.graphics;
			g.beginFill(color);
			g.drawCircle(posX, posY, radius);
			g.endFill();
		}
		
		public function scaleAnimat():void 
		{
			
		}
		
	}

}