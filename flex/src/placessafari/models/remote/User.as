package placessafari.models.remote
{
	[RemoteClass(alias='placessafari.model.remote.User')] 
    [Bindable] 
	public class User
	{
		public var id:int;
		public var email:String;		
		
		public function User()
		{
		}

	}
}