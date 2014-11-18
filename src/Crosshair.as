package  
{
	import flash.display.Stage;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */
	public class Crosshair extends MovieClip
	{
		public var crosshair:MovieClip = new croshair();
		public function Crosshair():void
		{
			Mouse.hide();
			crosshair = new croshair;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addChild(crosshair);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, updateFunction);
		}
			private function updateFunction(event:MouseEvent) : void {
			crosshair.x = stage.mouseX;
			crosshair.y = stage.mouseY;
		}
	}

}