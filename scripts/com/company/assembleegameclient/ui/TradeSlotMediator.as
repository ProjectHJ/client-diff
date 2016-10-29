package com.company.assembleegameclient.ui
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.text.view.BitmapTextFactory;
   
   public class TradeSlotMediator extends Mediator
   {
       
      
      [Inject]
      public var bitmapFactory:BitmapTextFactory;
      
      [Inject]
      public var view:com.company.assembleegameclient.ui.TradeSlot;
      
      public function TradeSlotMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.setBitmapFactory(this.bitmapFactory);
      }
   }
}
