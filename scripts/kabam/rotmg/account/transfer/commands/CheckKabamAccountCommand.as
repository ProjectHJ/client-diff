package kabam.rotmg.account.transfer.commands
{
   import kabam.rotmg.account.transfer.services.CheckKabamAccountTask;
   import kabam.rotmg.account.transfer.model.TransferAccountData;
   import kabam.rotmg.account.core.signals.UpdateAccountInfoSignal;
   import kabam.rotmg.core.signals.TaskErrorSignal;
   import kabam.lib.tasks.TaskMonitor;
   import kabam.rotmg.dialogs.control.CloseDialogsSignal;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.lib.tasks.BranchingTask;
   import kabam.lib.tasks.Task;
   import kabam.lib.tasks.DispatchSignalTask;
   import kabam.rotmg.account.transfer.view.TransferAccountView;
   
   public class CheckKabamAccountCommand
   {
       
      
      [Inject]
      public var checkKBMtask:CheckKabamAccountTask;
      
      [Inject]
      public var data:TransferAccountData;
      
      [Inject]
      public var updateAccount:UpdateAccountInfoSignal;
      
      [Inject]
      public var taskError:TaskErrorSignal;
      
      [Inject]
      public var monitor:TaskMonitor;
      
      [Inject]
      public var close:CloseDialogsSignal;
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      [Inject]
      public var loginError:TaskErrorSignal;
      
      public function CheckKabamAccountCommand()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:BranchingTask = new BranchingTask(this.checkKBMtask,this.makeSuccess(),this.makeFailure());
         this.monitor.add(_loc1_);
         _loc1_.start();
      }
      
      private function makeSuccess() : Task
      {
         return new DispatchSignalTask(this.openDialog,new TransferAccountView(this.data.currentEmail,this.data.currentPassword));
      }
      
      private function makeFailure() : Task
      {
         return new DispatchSignalTask(this.loginError,this.checkKBMtask);
      }
   }
}
