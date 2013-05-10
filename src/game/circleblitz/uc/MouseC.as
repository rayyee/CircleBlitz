package game.circleblitz.uc
{
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author rayyee
	 */
	public class MouseC
	{
		//鼠标是否按下了
		public var isDowned:Boolean = false;
		//师表是否是按下状态
		public var isDowning:Boolean = false;
		
		public var x:Number;
		public var y:Number;
		
		public function MouseC(c:DisplayObjectContainer)
		{
			c.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			c.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			c.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function onMouseMove(e:MouseEvent):void
		{
			x = e.stageX;
			y = e.stageY;
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			isDowning = isDowned = false;
		}
		
		private function onMouseDown(e:MouseEvent):void
		{
			isDowning = isDowned = true;
		}
	
	}

}