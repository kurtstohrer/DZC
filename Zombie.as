package code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.*;
	
	
	public class Zombie extends MovieClip 
	{
		//numbers
		private var deltaX:Number;
		private var deltaY:Number;
		//arrays
		private var bullets:Array;
		//classes
		private var myDoc:Document;
		private var zombies:Zombie;
		
	
		
		
		
		
		public function Zombie(aDoc:Document, bullet:Array) 
		{
			this.stop();
			//calls doc
			this.myDoc = aDoc;
			//calls bullet array
			this.bullets = bullet;
			//location
			this.x =  550
			this.y = 200
			//movement
			this.deltaX = Math.random()* 3;
			this.deltaY = Math.random()* 3;
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
					this.myDoc.changeScore(1);
					this.removeZombs();
					
		
					if (this.play())
				    {
						this.gotoAndStop(1);
						
						
					}
					
				}
			}
		}
		//movement
		private function moveMe():void
		{
			this.x += this.deltaX;
			this.y += this.deltaY;
			this.bounce();
		}
		// zombies bounce off borders
		public function bounce():void
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
		
		
		
		public function removeZombs():void
		{
			this.removeEventListener(Event.ENTER_FRAME, frameLoop);
			
			
			
			
		}
	}
	
}
