package placessafari
{
	import placessafari.controllers.*;
	import placessafari.models.*;
	import placessafari.views.*;
	
	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.facade.Facade; 
 
    // A concrete Facade for MyApp 
    public class ApplicationFacade extends Facade implements IFacade 
    {     	
  		// Define Notification name constants 
		public static const LOGIN:String  = "login"; 
  		public static const USER_LOGGED_SUCCESS:String = "user_logged_success";

 
  		// Singleton ApplicationFacade Factory Method 
  		public static function getInstance() : ApplicationFacade  
		{ 
   			if ( instance == null ) instance = new ApplicationFacade( ); 
   			return instance as ApplicationFacade; 
  		} 
 
  		// Register Commands with the Controller  
  		override protected function initializeController( ) : void  
  		{ 
   			super.initializeController();    
  		} 
 
  		// Startup the PureMVC apparatus, passing in a reference to the application  
  		public function startup( app:Application ) : void  
  		{  
  			
  		}
    } 

}