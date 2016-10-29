package kabam.rotmg.ui.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.ui.model.HUDModel;
   import kabam.rotmg.ui.signals.UpdateHUDSignal;
   import com.company.assembleegameclient.objects.Player;
   
   public class StatMetersMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.ui.view.StatMetersView;
      
      [Inject]
      public var hudModel:HUDModel;
      
      [Inject]
      public var updateHUD:UpdateHUDSignal;
      
      public function StatMetersMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.updateHUD.add(this.onUpdateHUD);
      }
      
      override public function destroy() : void
      {
         this.updateHUD.add(this.onUpdateHUD);
      }
      
      private function onUpdateHUD(param1:Player) : void
      {
         this.view.update(param1);
      }
   }
}
