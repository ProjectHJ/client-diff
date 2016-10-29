package kabam.rotmg.account.kongregate.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.account.core.view.RegisterWebAccountDialog;
   import kabam.rotmg.account.core.signals.RegisterAccountSignal;
   import kabam.rotmg.account.web.model.AccountData;
   
   public class KongregateRegisterWebAccountMediator extends Mediator
   {
       
      
      [Inject]
      public var view:RegisterWebAccountDialog;
      
      [Inject]
      public var register:RegisterAccountSignal;
      
      public function KongregateRegisterWebAccountMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.register.add(this.onRegister);
      }
      
      override public function destroy() : void
      {
         this.view.register.remove(this.onRegister);
      }
      
      private function onRegister(param1:AccountData) : void
      {
         this.register.dispatch(param1);
      }
   }
}
