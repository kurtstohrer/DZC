package code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.*;
	
	
	public class Monster extends MovieClip 
	{
		private var deltaX:Number;
		private var deltaY:Number;
		private var myDoc:Document;
		private var bullets:Array;
	
		
		//constructor
		public function Monster(aDoc:Document, bullet:Array) 
		{
			//stop animation
			this.stop();
			
			this.myDoc = aDoc;
			this.bullets = bullet;
			//location
			this.x =  550
			this.y = 200
			// movement
			this.deltaX = Math.random()* 10-7;
			this.deltaY = Math.random()* 5;
			//listeners
			this.addEventListener(Event.ENTER_FRAME, frameLoop);
		}
		private function frameLoop(e:Event):void
		{
			
			//movement
			this.moveMe();
			//collisons
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
					if (this.gotoAndPlay(34))
				    {
						this.gotoAndStop(50);
					}
					this.removeMons();
					
					
					
				}
			}
		}
		//moves monster
		public function moveMe():void
		{
			this.x += this.deltaX;
			this.y += this.deltaY;
			this.bounce();
		}
		//moster bounces of borders
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
		public function removeMons():void
		{
			this.removeEventListener(Event.ENTER_FRAME, frameLoop);
			
			
			
		}
	}
	
}
