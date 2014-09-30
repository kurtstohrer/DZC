package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Castle extends MovieClip 
	{
		private var zombies:Array;
		private var myDoc:Document;
		

		
		
		
		
		public function Castle(aDoc:Document, aZombies:Array) 
		{ 
			this.myDoc = aDoc;
			this.zombies = aZombies;
			//location
			this.x = 0;
			this.y = 200;
			
		}
		
		
	
}
}