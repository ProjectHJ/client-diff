package kabam.rotmg.pets.view.dialogs
{
   import kabam.rotmg.pets.view.components.DialogCloseButton;
   import kabam.lib.ui.api.Size;
   import com.company.assembleegameclient.ui.LineBreakDesign;
   import kabam.rotmg.pets.util.PetsViewAssetFactory;
   
   public class PetPickerDialog extends PetDialog
   {
      
      private static const padding:int = 12;
      
      private static const pickerHeight:int = 217;
       
      
      public var petPicker:kabam.rotmg.pets.view.dialogs.PetPicker;
      
      public var closeButton:DialogCloseButton;
      
      public function PetPickerDialog(param1:kabam.rotmg.pets.view.dialogs.PetPicker)
      {
         super("PetPicker.title","PetPicker.text",null,null,null);
         this.petPicker = param1;
         this.makePetPicker();
         this.closeButton = PetsViewAssetFactory.returnCloseButton(dialogWidth);
         box_.addChild(this.closeButton);
      }
      
      override protected function setDialogWidth() : int
      {
         return 330;
      }
      
      private function makePetPicker() : void
      {
         this.petPicker.setSize(new Size(dialogWidth - padding * 2,pickerHeight));
         this.petPicker.setPadding(8);
         this.petPicker.setPetSize(48);
      }
      
      override protected function drawAdditionalUI() : void
      {
         super.drawAdditionalUI();
         this.addLineBreak();
         this.addPetPicker();
      }
      
      private function addPetPicker() : void
      {
         this.petPicker.x = padding;
         this.petPicker.y = this.getBoxBottomWithPadding();
         box_.addChild(this.petPicker);
      }
      
      private function addLineBreak() : void
      {
         var _loc1_:LineBreakDesign = new LineBreakDesign(dialogWidth - padding * 2,0);
         _loc1_.x = padding;
         _loc1_.y = this.getBoxBottomWithPadding();
         box_.addChild(_loc1_);
      }
      
      private function getBoxBottomWithPadding() : Number
      {
         return box_.getBounds(this).bottom + padding;
      }
      
      override protected function getBoxHeight() : Number
      {
         return super.getBoxHeight() - (this.petPicker.height - pickerHeight);
      }
   }
}
