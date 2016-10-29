package kabam.rotmg.pets.view.dialogs
{
   import com.company.assembleegameclient.ui.dialogs.Dialog;
   
   public class PetDialog extends Dialog
   {
       
      
      protected var petDialogStyler:kabam.rotmg.pets.view.dialogs.PetDialogStyler;
      
      public function PetDialog(param1:String, param2:String, param3:String, param4:String, param5:String)
      {
         this.petDialogStyler = new kabam.rotmg.pets.view.dialogs.PetDialogStyler(this);
         super(param1,param2,param3,param4,param5);
         this.petDialogStyler.stylizePetDialog();
      }
      
      override protected function drawAdditionalUI() : void
      {
         this.petDialogStyler.positionText();
      }
      
      override protected function drawGraphicsTemplate() : void
      {
         this.petDialogStyler.drawGraphics();
      }
   }
}
