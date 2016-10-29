package kabam.rotmg.startup.model.impl
{
   import kabam.rotmg.startup.model.api.StartupDelegate;
   import org.swiftsuspenders.Injector;
   import kabam.lib.tasks.Task;
   import org.osflash.signals.Signal;
   import kabam.lib.tasks.DispatchSignalTask;
   
   public class SignalTaskDelegate implements StartupDelegate
   {
       
      
      public var injector:Injector;
      
      public var signalClass:Class;
      
      public var priority:int;
      
      public function SignalTaskDelegate()
      {
         super();
      }
      
      public function getPriority() : int
      {
         return this.priority;
      }
      
      public function make() : Task
      {
         var _loc1_:Signal = this.injector.getInstance(this.signalClass);
         return new DispatchSignalTask(_loc1_);
      }
   }
}