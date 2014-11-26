package  
{
	import flash.display.Stage;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.events.EventDispatcher;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Nick van Dokkum
	 */

	public class Crosshair extends MovieClip
	{
		private var crosshairArt:MovieClip = new crosshair();
		public function Crosshair():void
		{
			Mouse.hide();
			crosshairArt = new crosshair;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addChild(crosshairArt);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, updateFunction);
		}
		private function updateFunction(event:MouseEvent) : void {
			crosshairArt.x = stage.mouseX;
			crosshairArt.y = stage.mouseY;
		}
	}
}