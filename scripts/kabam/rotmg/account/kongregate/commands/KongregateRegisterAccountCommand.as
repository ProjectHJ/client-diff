package kabam.rotmg.account.kongregate.commands
{
   import kabam.rotmg.account.web.model.AccountData;
   import kabam.rotmg.account.core.services.RegisterAccountTask;
   import kabam.lib.tasks.TaskMonitor;
   import kabam.rotmg.account.core.signals.UpdateAccountInfoSignal;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.rotmg.core.signals.TaskErrorSignal;
   import kabam.lib.tasks.BranchingTask;
   import kabam.lib.tasks.TaskSequence;
   import kabam.lib.tasks.DispatchSignalTask;
   import kabam.rotmg.account.kongregate.view.KongregateAccountDetailDialog;
   import kabam.lib.tasks.Task;
   
   public class KongregateRegisterAccountCommand
   {
       
      
      [Inject]
      public var data:AccountData;
      
      [Inject]
      public var task:RegisterAccountTask;
      
      [Inject]
      public var monitor:TaskMonitor;
      
      [Inject]
      public var update:UpdateAccountInfoSignal;
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      [Inject]
      public var taskError:TaskErrorSignal;
      
      public function KongregateRegisterAccountCommand()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:BranchingTask = new BranchingTask(this.task,this.onSuccess(),this.onFailure());
         this.monitor.add(_loc1_);
         _loc1_.start();
      }
      
      private function onSuccess() : TaskSequence
      {
         var _loc1_:TaskSequence = new TaskSequence();
         _loc1_.add(new DispatchSignalTask(this.update));
         _loc1_.add(new DispatchSignalTask(this.openDialog,new KongregateAccountDetailDialog()));
         return _loc1_;
      }
      
      private function onFailure() : Task
      {
         return new DispatchSignalTask(this.taskError,this.task);
      }
   }
}
