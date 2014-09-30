package code 
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	
	public class Bullet extends MovieClip 
	{
		
		//classes
		private var guy:Guy;
		private var myDoc:Document;
		//numbers
		private var myspeed:Number;
		private var guyRotation:Number;
		private var turnAmount:Number = 10;
		
		
		
		public function Bullet(doc:Document, myX:Number, myY:Number, rotate:Number, aSpeed:Number=10)
		{
			//starting location
			this.x = myX; 
			this.y = myY;
			//speed
			this.myspeed = aSpeed;
			//document
			this.myDoc = doc;
			//for gettin bullet rotation to = guy.rotation
			this.rotation = rotate;
			//listeners
			this.addEventListener(Event.ENTER_FRAME, frameLoop)
			
			
		}
		public function frameLoop(e:Event):void
		{
			//calls fwd function every frame
			this.fwd();
		}
		
		//moves bullet foward
		public function fwd():void
		{
			this.x = this.x + this.myspeed * Math.cos(rotation * Math.PI / 180);
			this.y = this.y + this.myspeed * Math.sin(rotation * Math.PI / 180);
			
			
		}
		
		
		
	}
	
}
