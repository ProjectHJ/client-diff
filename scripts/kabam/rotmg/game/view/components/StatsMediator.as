package kabam.rotmg.game.view.components
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.ui.signals.UpdateHUDSignal;
   import kabam.rotmg.ui.view.StatsDockedSignal;
   import com.company.assembleegameclient.objects.Player;
   import flash.events.MouseEvent;
   
   public class StatsMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.game.view.components.StatsView;
      
      [Inject]
      public var updateHUD:UpdateHUDSignal;
      
      [Inject]
      public var statsUndocked:kabam.rotmg.game.view.components.StatsUndockedSignal;
      
      [Inject]
      public var statsDocked:StatsDockedSignal;
      
      public function StatsMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.mouseDown.add(this.onStatsDrag);
         this.updateHUD.add(this.onUpdateHUD);
         this.statsDocked.add(this.onStatsDock);
      }
      
      override public function destroy() : void
      {
         this.view.mouseDown.remove(this.onStatsDrag);
         this.updateHUD.remove(this.onUpdateHUD);
      }
      
      private function onUpdateHUD(param1:Player) : void
      {
         this.view.draw(param1);
      }
      
      private function onStatsDrag(param1:MouseEvent) : void
      {
         if(this.view.currentState == kabam.rotmg.game.view.components.StatsView.STATE_DOCKED)
         {
            this.view.undock();
            this.statsUndocked.dispatch(this.view);
         }
      }
      
      private function onStatsDock() : void
      {
         this.view.dock();
      }
   }
}