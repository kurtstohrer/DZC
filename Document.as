package code
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.events.TimerEvent;


	public class Document extends MovieClip
	{
		//classes
		public var guy:Guy;
		private var cass:Castle;
		private var boots:Dasboots;
		
		//arrays
		private var bullets:Array;
		private var zombies:Array;
		private var mons:Array;
		private var crb:Array;
		//numbers
		private var deltaX:Number;
		private var deltaY:Number;
		private var score:Number = 0;
		//timers
		private var zombieTimer:Timer = new Timer(1000);
		private var crabTimer:Timer = new Timer(3000);
		private var monsTimer:Timer = new Timer(8000);
		private var bootTimer:Timer = new Timer(35000);
		

		//booleans
		private var dIsPressed:Boolean = false;
		private var aIsPressed:Boolean = false;
		private var wIsPressed:Boolean = false;
		private var spaceIsPressed:Boolean = false;


		public function Document()
		{
			stop();
			goBtn.addEventListener(MouseEvent.CLICK, startGame);
			
		


			


		}
		//starts gmae by clicking on button
		private function startGame(e:MouseEvent):void
		{
			 this.gotoAndStop(2);
			 this.goGame();
		}
		
		
		//function to fire arrow
		private function launchBullet(e:KeyboardEvent):void
		{
			if (spaceIsPressed)
			{
				
				var d:Bullet = new Bullet(this,this.guy.x,
			  	 this.guy.y, this.guy.rotation, 7);
				this.addChild(d);
				this.bullets.push(d);
			}
			


		}
		// intiats game functions
		public function goGame()
		{
			this.zombies = new Array();
			this.bullets = new Array();
			this.mons = new Array();
			this.crb = new Array();
			
			this.boots = new Dasboots();
			this.addChild(boots);
			
			this.cass = new Castle(this,zombies) 
			this.addChild(cass);
			this.guy = new Guy(this,100,250,3,zombies,boots)
			this.addChild(guy);
			

			this.score = 0;
			scoreBox.text = String(this.score);

			addEventListener(Event.ENTER_FRAME, frameLoop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, launchBullet);
			zombieTimer.addEventListener(TimerEvent.TIMER, createZombie);
			monsTimer.addEventListener(TimerEvent.TIMER, createMonster);
			bootTimer.addEventListener(TimerEvent.TIMER, createBoots);
			crabTimer.addEventListener(TimerEvent.TIMER, createCrab);
			
			zombieTimer.start();
			monsTimer.start();
			bootTimer.start();
			crabTimer.start();
			
		
			
		}
		//creates the boots every 35 seonds
		private function createBoots(e:TimerEvent):void
		{
			this.boots.newLoc();
			
		}
		
	
		//creates a zombie every second
		private function createZombie(e:TimerEvent):void
		{
			
			
			for (var i:int=0; i<1; i++)
			{
				var zo:Zombie = new Zombie(this,bullets);
				this.addChild(zo);
				this.zombies.push(zo);
				
			}
			
			
		}
		//creats a monster every 8 seconds
		private function createMonster(e:TimerEvent):void 
		{
			for (var m:int=0; m<1; m++)
			{
				var mo:Monster = new Monster(this,bullets);
				this.addChild(mo);
				this.mons.push(mo);
				
			}
		}
		//creats a crab every 3 seconds
		private function createCrab(e:TimerEvent):void
		{
			for (var k:int=0; k<1; k++)
			{
				var cr:crab = new crab(this,bullets);
				this.addChild(cr);
				this.crb.push(cr);
			}
		}

		private function frameLoop(e:Event):void
		{
			//collisions
			this.checkCollisions();
			this.checkMCollisons();
			this.checkCCollisons();
			
			//keys-movement
			if (dIsPressed)
			{
				this.guy.turnRight();
				//this.bullets.turnRightb();
				
			}
			if (aIsPressed)
			{
				this.guy.turnLeft();
				//this.bullets.turnLeftb();
			}
			if (wIsPressed)
			{
				this.guy.fwd();
			}
			
			
			



		}
		//checks collision between zombie and castle
		private function checkCollisions(): void
		{
			for (var i:int = 0; i < this.zombies.length; i++)
			{
				if(this.cass.hitTestObject(this.zombies[i]))
				{
					this.endGame();
				}
				
				
			}
			
			
		}
		//checks collison between monster and castle
		private function checkMCollisons():void
		{
			for (var m:int= 0; m < this.mons.length; m++)
			{
				if(this.cass.hitTestObject(this.mons[m]))
				{
					this.endGame();
				}
			}
		}
		//checks collision between crab nad castle
		private function checkCCollisons():void
		{
			for (var k:int=0; k < this.crb.length; k++)
			{
				if(this.cass.hitTestObject(this.crb[k]))
				{
					this.endGame();
				}
			}
		}
		//keys
		private function keyDownHandler(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.RIGHT)
			{
				dIsPressed = true;;
			}
			if (e.keyCode == Keyboard.LEFT)
			{
				aIsPressed = true;
			}
			if (e.keyCode == Keyboard.UP)
			{
				wIsPressed = true;
			}
			if (e.keyCode == Keyboard.SPACE)
			{
				spaceIsPressed = true;
			}

		}
		//keys
		private function keyUpHandler(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.RIGHT)
			{
				dIsPressed = false;
			}
			if (e.keyCode == Keyboard.LEFT)
			{
				aIsPressed = false;
			}
			if (e.keyCode == Keyboard.UP)
			{
				wIsPressed = false;
			}
			if (e.keyCode == Keyboard.SPACE)
			{
				spaceIsPressed = false;
			}

		}
		//changes score
		public function changeScore(amt:Number)
		{
			this.score += amt;
			scoreBox.text = String(this.score);
		}
		//button for credits
		private function credits(e:MouseEvent): void
		{
			this.gotoAndStop(4);
		}
		//button for restarting game
		private function restart (e:MouseEvent):void
		{
			this.gotoAndStop(2);
			this.goGame();
		}
		//removes listners children etc
		public function endGame():void
		{
		 
			this.removeEventListener(Event.ENTER_FRAME, frameLoop);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, launchBullet);
			zombieTimer.removeEventListener(TimerEvent.TIMER, createZombie);
			monsTimer.removeEventListener(TimerEvent.TIMER, createMonster);
			bootTimer.removeEventListener(TimerEvent.TIMER, createBoots);
			crabTimer.removeEventListener(TimerEvent.TIMER, createCrab);
			this.removeChild(guy);
			this.removeChild(cass);
			this.removeChild(boots);
			this.gotoAndStop(3);
			credBtn.addEventListener(MouseEvent.CLICK, credits);
			resBtn.addEventListener(MouseEvent.CLICK, restart);
			
			for (var i:int = 0; i < this.zombies.length; i++)
			{
				this.removeChild(zombies[i]);
			
			
			}
			for (var m:int = 0; m < this.mons.length; m++)
			{
				this.removeChild(mons[m]);
			
			
			}
			for (var k:int = 0; k < this.crb.length; k++)
			{
				this.removeChild(crb[k]);
			}
			
			
	}

}
}