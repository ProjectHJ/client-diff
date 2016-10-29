package kabam.rotmg.core.commands
{
   import kabam.rotmg.core.model.PlayerModel;
   import kabam.rotmg.core.signals.SetScreenSignal;
   import flash.display.Sprite;
   import kabam.lib.tasks.TaskMonitor;
   import kabam.rotmg.account.core.services.GetCharListTask;
   import com.company.assembleegameclient.screens.LoadingScreen;
   import kabam.lib.tasks.TaskSequence;
   import kabam.lib.tasks.DispatchSignalTask;
   
   public class SetScreenWithValidDataCommand
   {
       
      
      [Inject]
      public var model:PlayerModel;
      
      [Inject]
      public var setScreen:SetScreenSignal;
      
      [Inject]
      public var view:Sprite;
      
      [Inject]
      public var monitor:TaskMonitor;
      
      [Inject]
      public var task:GetCharListTask;
      
      public function SetScreenWithValidDataCommand()
      {
         super();
      }
      
      public function execute() : void
      {
         if(this.model.isInvalidated)
         {
            this.reloadDataThenSetScreen();
         }
         else
         {
            this.setScreen.dispatch(this.view);
         }
      }
      
      private function reloadDataThenSetScreen() : void
      {
         this.setScreen.dispatch(new LoadingScreen());
         var _loc1_:TaskSequence = new TaskSequence();
         _loc1_.add(this.task);
         _loc1_.add(new DispatchSignalTask(this.setScreen,this.view));
         this.monitor.add(_loc1_);
         _loc1_.start();
      }
   }
}
