package kabam.lib.tasks
{
   public class TaskMonitor
   {
       
      
      private var tasks:Vector.<kabam.lib.tasks.Task>;
      
      public function TaskMonitor()
      {
         super();
         this.tasks = new Vector.<kabam.lib.tasks.Task>(0);
      }
      
      public function add(param1:kabam.lib.tasks.Task) : void
      {
         this.tasks.push(param1);
         param1.finished.addOnce(this.onTaskFinished);
      }
      
      public function has(param1:kabam.lib.tasks.Task) : Boolean
      {
         return this.tasks.indexOf(param1) != -1;
      }
      
      private function onTaskFinished(param1:kabam.lib.tasks.Task, param2:Boolean, param3:String = "") : void
      {
         this.tasks.splice(this.tasks.indexOf(param1),1);
      }
   }
}
