package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Dasboots extends MovieClip 
	{
		
		
		public function Dasboots() 
		{
			
			//location
			this.x = 1000;
			this.y = 1000;
		}
		public function newLoc():void
		{
			//new location after timer is called
			this.x = 60
			this.y = 50
		}
		
	}
	
}
