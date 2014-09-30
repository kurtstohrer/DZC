package code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.*;
	
	
	public class crab extends MovieClip 
	{
		//numbers
		private var deltaX:Number;
		private var deltaY:Number;
		//classes
		private var myDoc:Document;
		//arrays
		private var bullets:Array;
	
		
		
		public function crab(aDoc:Document, bullet:Array) 
		{
			this.stop();
			//classes
			this.myDoc = aDoc;
			//arrays
			this.bullets = bullet;
			//location
			this.x =  550
			this.y = 200
			//movement
			this.deltaX = Math.random()* 12-5;
			this.deltaY = Math.random()* 7-4;
			//listeners
			this.addEventListener(Event.ENTER_FRAME, frameLoop);
		}
		private function frameLoop(e:Event):void
		{
			//movement
			this.moveMe();
			//collisions
			this.checkCollisions();
			
		}
		private function checkCollisions():void
		{
			for (var i:int=0; i<this.bullets.length; i++)
			{
				if (this.hitTestPoint(this.bullets[i].x, 
									   this.bullets[i].y, 
									   true))
									   
				{
					//changecore
					this.myDoc.changeScore(1);
					if (this.gotoAndPlay(1))
				    {
						this.gotoAndStop(28);
					}
					this.removeCrab();
					
					
					
				}
			}
		}
		// movement
		public function moveMe():void
		{
			this.x += this.deltaX;
			this.y += this.deltaY;
			//calls bounce
			this.bounce();
		}
		// crabs bounce of borders
		private function bounce():void
		{
			if(this.x > 550 - this.width/2)
			{
				this.deltaX *= -1;
				this.x = 550 - this.width/2;
			}
			
			if(this.y > 400 - this.height/2)
			{
				this.deltaY *= -1;
				this.y = 400 - this.height/2;
			}
			if(this.y < this.height/2)
			{
				this.deltaY *= -1;
				this.y = this.height/2;
			}
		}
		public function removeCrab():void
		{
			this.removeEventListener(Event.ENTER_FRAME, frameLoop);
			
			
			
		}
	}
	
}
