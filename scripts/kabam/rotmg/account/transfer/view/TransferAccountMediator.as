package kabam.rotmg.account.transfer.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.dialogs.control.CloseDialogsSignal;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.rotmg.account.transfer.signals.TransferAccountSignal;
   import kabam.rotmg.core.signals.TaskErrorSignal;
   import kabam.rotmg.account.transfer.model.TransferAccountData;
   import kabam.lib.tasks.Task;
   
   public class TransferAccountMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.account.transfer.view.TransferAccountView;
      
      [Inject]
      public var closeDialog:CloseDialogsSignal;
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      [Inject]
      public var transfer:TransferAccountSignal;
      
      [Inject]
      public var loginError:TaskErrorSignal;
      
      public function TransferAccountMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.transfer.add(this.onTransfer);
         this.view.cancel.add(this.onCancel);
         this.loginError.add(this.onLoginError);
      }
      
      override public function destroy() : void
      {
         this.view.transfer.remove(this.onTransfer);
         this.view.cancel.remove(this.onCancel);
         this.loginError.remove(this.onLoginError);
      }
      
      private function onTransfer(param1:TransferAccountData) : void
      {
         this.view.disable();
         this.transfer.dispatch(param1);
      }
      
      private function onLoginError(param1:Task) : void
      {
         this.view.displayServerError(param1.error);
         this.view.enable();
      }
      
      private function onCancel() : void
      {
         this.closeDialog.dispatch();
      }
   }
}
