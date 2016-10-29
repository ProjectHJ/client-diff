package kabam.rotmg.game.view.components
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.ui.panels.itemgrids.InventoryGrid;
   import kabam.rotmg.ui.view.PotionInventoryView;
   import com.company.assembleegameclient.objects.Player;
   import kabam.rotmg.ui.model.TabStripModel;
   import kabam.rotmg.constants.GeneralConstants;
   
   public class BackpackTabContent extends Sprite
   {
       
      
      private var backpackContent:Sprite;
      
      private var backpack:InventoryGrid;
      
      private var backpackPotionsInventory:PotionInventoryView;
      
      public function BackpackTabContent(param1:Player)
      {
         this.backpackContent = new Sprite();
         this.backpackPotionsInventory = new PotionInventoryView();
         super();
         this.init(param1);
         this.addChildren();
         this.positionChildren();
      }
      
      private function init(param1:Player) : void
      {
         this.backpackContent.name = TabStripModel.BACKPACK;
         this.backpack = new InventoryGrid(param1,param1,GeneralConstants.NUM_EQUIPMENT_SLOTS + GeneralConstants.NUM_INVENTORY_SLOTS,true);
      }
      
      private function positionChildren() : void
      {
         this.backpackContent.x = 7;
         this.backpackContent.y = 7;
         this.backpackPotionsInventory.y = this.backpack.height + 4;
      }
      
      private function addChildren() : void
      {
         this.backpackContent.addChild(this.backpack);
         this.backpackContent.addChild(this.backpackPotionsInventory);
         addChild(this.backpackContent);
      }
   }
}
