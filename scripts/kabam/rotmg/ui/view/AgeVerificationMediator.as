package kabam.rotmg.ui.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.account.core.signals.VerifyAgeSignal;
   import kabam.rotmg.dialogs.control.CloseDialogsSignal;
   
   public class AgeVerificationMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.ui.view.AgeVerificationDialog;
      
      [Inject]
      public var verifyAge:VerifyAgeSignal;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      public function AgeVerificationMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.response.add(this.onResponse);
      }
      
      override public function destroy() : void
      {
         this.view.response.remove(this.onResponse);
      }
      
      private function onResponse(param1:Boolean) : void
      {
         if(param1)
         {
            this.handleAccepted();
         }
         else
         {
            this.handleRejected();
         }
      }
      
      private function handleAccepted() : void
      {
         this.verifyAge.dispatch();
         this.closeDialogs.dispatch();
      }
      
      private function handleRejected() : void
      {
         this.closeDialogs.dispatch();
      }
   }
}
