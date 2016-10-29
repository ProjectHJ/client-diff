package com.company.assembleegameclient.objects
{
   import kabam.rotmg.game.signals.TextPanelMessageUpdateSignal;
   import com.company.assembleegameclient.ui.tooltip.ToolTip;
   import com.company.assembleegameclient.ui.tooltip.TextToolTip;
   import kabam.rotmg.text.model.TextKey;
   import com.company.assembleegameclient.ui.panels.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import kabam.rotmg.game.view.TextPanel;
   import kabam.rotmg.core.StaticInjectorContext;
   
   public class ClosedGiftChest extends GameObject implements IInteractiveObject
   {
       
      
      private var textPanelUpdateSignal:TextPanelMessageUpdateSignal;
      
      public function ClosedGiftChest(param1:XML)
      {
         super(param1);
         isInteractive_ = true;
         this.textPanelUpdateSignal = StaticInjectorContext.getInjector().getInstance(TextPanelMessageUpdateSignal);
      }
      
      public function getTooltip() : ToolTip
      {
         var _loc1_:ToolTip = new TextToolTip(3552822,10197915,TextKey.CLOSEDGIFTCHEST_TITLE,TextKey.TEXTPANEL_GIFTCHESTISEMPTY,200);
         return _loc1_;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         this.textPanelUpdateSignal.dispatch(TextKey.TEXTPANEL_GIFTCHESTISEMPTY);
         return new TextPanel(param1);
      }
   }
}
