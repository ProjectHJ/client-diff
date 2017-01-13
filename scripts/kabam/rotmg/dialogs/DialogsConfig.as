package kabam.rotmg.dialogs
{
   import kabam.lib.console.signals.RegisterConsoleActionSignal;
   import kabam.lib.console.vo.ConsoleAction;
   import kabam.rotmg.dialogs.control.CloseDialogsSignal;
   import kabam.rotmg.dialogs.control.OpenDialogNoModalSignal;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.rotmg.dialogs.control.PopDialogSignal;
   import kabam.rotmg.dialogs.control.PushDialogSignal;
   import kabam.rotmg.dialogs.control.ShowDialogBackgroundSignal;
   import kabam.rotmg.dialogs.view.DialogsMediator;
   import kabam.rotmg.dialogs.view.DialogsView;
   import org.swiftsuspenders.Injector;
   import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
   import robotlegs.bender.framework.api.IConfig;
   
   public class DialogsConfig implements IConfig
   {
       
      
      [Inject]
      public var injector:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var register:RegisterConsoleActionSignal;
      
      public function DialogsConfig()
      {
         super();
      }
      
      public function configure() : void
      {
         var _loc1_:ConsoleAction = null;
         this.injector.map(ShowDialogBackgroundSignal).asSingleton();
         this.injector.map(OpenDialogSignal).asSingleton();
         this.injector.map(OpenDialogNoModalSignal).asSingleton();
         this.injector.map(CloseDialogsSignal).asSingleton();
         this.injector.map(PushDialogSignal).asSingleton();
         this.injector.map(PopDialogSignal).asSingleton();
         this.mediatorMap.map(DialogsView).toMediator(DialogsMediator);
         _loc1_ = new ConsoleAction();
         _loc1_.name = "closeDialogs";
         _loc1_.description = "closes all open dialogs";
         this.register.dispatch(_loc1_,this.injector.getInstance(CloseDialogsSignal));
      }
   }
}
