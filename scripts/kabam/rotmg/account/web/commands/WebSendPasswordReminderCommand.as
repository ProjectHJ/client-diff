package kabam.rotmg.account.web.commands
{
   import kabam.rotmg.account.core.services.SendPasswordReminderTask;
   import kabam.lib.tasks.TaskMonitor;
   import kabam.rotmg.core.signals.TaskErrorSignal;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.lib.tasks.TaskGroup;
   import kabam.lib.tasks.DispatchSignalTask;
   import kabam.rotmg.account.web.view.WebLoginDialog;
   import kabam.lib.tasks.BranchingTask;
   
   public class WebSendPasswordReminderCommand
   {
       
      
      [Inject]
      public var email:String;
      
      [Inject]
      public var task:SendPasswordReminderTask;
      
      [Inject]
      public var monitor:TaskMonitor;
      
      [Inject]
      public var taskError:TaskErrorSignal;
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      public function WebSendPasswordReminderCommand()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:TaskGroup = new TaskGroup();
         _loc1_.add(new DispatchSignalTask(this.openDialog,new WebLoginDialog()));
         var _loc2_:TaskGroup = new TaskGroup();
         _loc2_.add(new DispatchSignalTask(this.taskError,this.task));
         var _loc3_:BranchingTask = new BranchingTask(this.task,_loc1_,_loc2_);
         this.monitor.add(_loc3_);
         _loc3_.start();
      }
   }
}
