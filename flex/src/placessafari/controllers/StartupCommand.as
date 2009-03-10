package placessafari.controllers
{
	import com.goomer.model.LoginProxy;
	import com.goomer.view.ApplicationMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;	

	public class StartupCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {		
			var app:Application = notification.getBody() as Application;
				
		 	// we setup the login service
		 	//var urlString:String = app.url;
		 	var urlString:String = "http://localhost:3000"
		 	var data:Object = { url: urlString };
			this.facade.registerProxy(new LoginProxy(data));	
			
			// we setup the Application mediator
			this.facade.registerMediator(new ApplicationMediator(app));		
		}
		
	}
}