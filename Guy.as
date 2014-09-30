package code {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Guy extends MovieClip 
	{
		//classes
		private var myDoc:Document;
		private var boots:Dasboots;
		//numbers
		private var mySpeed:Number;
		private var turnAmount:Number = 8;
		//arrays
		private var zombies:Array;
		
		
		

		
		public function Guy(aDoc:Document, aX:Number, aY:Number, aSpeed:Number, aZombies:Array, aboots:Dasboots):void
		{
			this.myDoc = aDoc;
			//location
			this.x = aX;
			this.y = aY;
			//speed
			this.mySpeed = aSpeed;
			//arrays
			this.zombies = aZombies;
			this.boots = aboots;
			//listeners
			this.addEventListener(Event.ENTER_FRAME, frameLoop);

		}
		//for turning
		public function turnLeft():void
		{
			this.rotation -= this.turnAmount;
		}

		public function turnRight():void
		{
			this.rotation += this.turnAmount;
		}
		
		public function frameLoop(e:Event):void
		{
			//collisons
			this.checkBCollide();
		}
			
			
		
		private function checkBCollide():void
		{
				if (this.hitTestObject(this.boots))
				{
					this.fast();
					this.boots.play();
				}
				
		}
		//for forward movement
		public function fwd():void
		{
			this.x = this.x + this.mySpeed * Math.cos(rotation * Math.PI / 180);
			this.y = this.y + this.mySpeed * Math.sin(rotation * Math.PI / 180);
			this.bounce();
		}
		
		
		//makes guy move faster
		public function fast():void
		{
			this.mySpeed = this.mySpeed + 2 
		
		}
		//guy cannot go past border of screen
		private function bounce():void
		{
			if(this.x > 550 - this.width/2)
			{
				this.x *= -1;
				this.x = 550 - this.width/2;
			}
			if(this.x < this.width/2)
			{
				this.x *= -1;
				this.x = this.width/2;
			}
			if(this.y > 400 - this.height/2)
			{
				this.y *= -1;
				this.y = 400 - this.height/2;
			}
			if(this.y < this.height/2)
			{
				this.y *= -1;
				this.y = this.height/2;
			}
		}
		public function removeStuff():void
		{
			this.removeEventListener(Event.ENTER_FRAME, frameLoop);
			
		}
			
		}
	}
	

