package com.company.assembleegameclient.objects
{
   import kabam.rotmg.text.model.TextKey;
   import com.company.assembleegameclient.ui.tooltip.ToolTip;
   import com.company.assembleegameclient.ui.tooltip.TextToolTip;
   import flash.display.BitmapData;
   
   public class ClosedVaultChest extends SellableObject
   {
       
      
      public function ClosedVaultChest(param1:XML)
      {
         super(param1);
      }
      
      override public function soldObjectName() : String
      {
         return TextKey.VAULT_CHEST;
      }
      
      override public function soldObjectInternalName() : String
      {
         return "Vault Chest";
      }
      
      override public function getTooltip() : ToolTip
      {
         var _loc1_:ToolTip = new TextToolTip(3552822,10197915,this.soldObjectName(),TextKey.VAULT_CHEST_DESCRIPTION,200);
         return _loc1_;
      }
      
      override public function getSellableType() : int
      {
         return ObjectLibrary.idToType_["Vault Chest"];
      }
      
      override public function getIcon() : BitmapData
      {
         return ObjectLibrary.getRedrawnTextureFromType(ObjectLibrary.idToType_["Vault Chest"],80,true);
      }
   }
}
