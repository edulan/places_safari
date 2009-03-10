package placessafari.views.mediators
{
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;

	public class TestWindowMediator extends Mediator implements IMediator
	{
		public function TestWindowMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		public function getMediatorName():String
		{
			return null;
		}
		
		public function getViewComponent():Object
		{
			return null;
		}
		
		public function setViewComponent(viewComponent:Object):void
		{
		}
		
		public function listNotificationInterests():Array
		{
			return null;
		}
		
		public function handleNotification(notification:INotification):void
		{
		}
		
		public function onRegister():void
		{
		}
		
		public function onRemove():void
		{
		}
		
	}
}