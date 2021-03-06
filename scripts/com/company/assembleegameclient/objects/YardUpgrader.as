package com.company.assembleegameclient.objects
{
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.ui.panels.Panel;
   import com.company.assembleegameclient.ui.tooltip.TextToolTip;
   import com.company.assembleegameclient.ui.tooltip.ToolTip;
   import kabam.rotmg.pets.view.components.YardUpgraderPanel;
   import kabam.rotmg.text.model.TextKey;
   
   public class YardUpgrader extends GameObject implements IInteractiveObject
   {
       
      
      public function YardUpgrader(param1:XML)
      {
         super(param1);
         isInteractive_ = true;
      }
      
      public function getTooltip() : ToolTip
      {
         var _loc1_:ToolTip = new TextToolTip(3552822,10197915,TextKey.CLOSEDGIFTCHEST_TITLE,TextKey.TEXTPANEL_GIFTCHESTISEMPTY,200);
         return _loc1_;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new YardUpgraderPanel(param1,objectType_);
      }
   }
}
