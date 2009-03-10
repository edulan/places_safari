package placessafari.models
{
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import placessafari.models.remote.User;

	public class UserProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "UserProxy";
		public static const SIGNED_UP:String = "UserSignedUp";
		public static const SIGN_UP_ERROR:String = "UserSignedUpError";		
		public static const ERROR:String = "UserError";
		
		[Bindable]
		public var user:User;
		 	
		private var ro:RemoteObject;	
				
		private var nextError:String;
		
		public function UserProxy(data:Object=null)
		{
			super(NAME, data);
			categories = new Array();					
				
			ro = new RemoteObject("rubyamf");			
			ro.source = "UsersController"						
		}
		
		public function getProxyName():String
		{
			return UserProxy.NAME;
		}
		
		public function signup(login,password):void {
			ro.addEventListener(FaultEvent.FAULT,function(event:FaultEvent) {
				sendNotification(UserProxy.SIGN_UP_ERROR,"error siging up");
			});
			this.nextError = "Error registrando usuario"
			ro.addEventListener(ResultEvent.RESULT,onSuccessSignup);
			var token:AsyncToken = AsyncToken(ro.getOperation("create").send(login,password))
			token.kind = "create"
		}
		
		public function onSuccessSignup(event:ResultEvent):void {
			ro.removeEventListener(ResultEvent.RESULT,onSuccessSignup);
			this.user = event.result as User;
			this.sendNotification(UserProxy.SIGNED_UP);
		}
		
	}
}