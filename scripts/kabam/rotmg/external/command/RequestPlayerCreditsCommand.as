package kabam.rotmg.external.command
{
   import robotlegs.bender.bundles.mvcs.Command;
   import kabam.lib.tasks.TaskMonitor;
   import org.swiftsuspenders.Injector;
   import kabam.lib.tasks.TaskSequence;
   import kabam.rotmg.external.service.RequestPlayerCreditsTask;
   import kabam.lib.tasks.DispatchSignalTask;
   
   public class RequestPlayerCreditsCommand extends Command
   {
       
      
      [Inject]
      public var taskMonitor:TaskMonitor;
      
      [Inject]
      public var injector:Injector;
      
      [Inject]
      public var requestPlayerCreditsComplete:kabam.rotmg.external.command.RequestPlayerCreditsCompleteSignal;
      
      public function RequestPlayerCreditsCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:TaskSequence = new TaskSequence();
         _loc1_.add(this.injector.getInstance(RequestPlayerCreditsTask));
         _loc1_.add(new DispatchSignalTask(this.requestPlayerCreditsComplete));
         this.taskMonitor.add(_loc1_);
         _loc1_.start();
      }
   }
}
