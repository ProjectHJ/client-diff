package com.company.assembleegameclient.ui.panels.mediators
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import com.company.assembleegameclient.ui.panels.itemgrids.InventoryGrid;
   import kabam.rotmg.ui.signals.UpdateHUDSignal;
   import com.company.assembleegameclient.objects.Player;
   
   public class InventoryGridMediator extends Mediator
   {
       
      
      [Inject]
      public var view:InventoryGrid;
      
      [Inject]
      public var updateHUD:UpdateHUDSignal;
      
      public function InventoryGridMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.updateHUD.add(this.onUpdateHUD);
      }
      
      override public function destroy() : void
      {
         this.updateHUD.remove(this.onUpdateHUD);
      }
      
      private function onUpdateHUD(param1:Player) : void
      {
         this.view.draw();
      }
   }
}
