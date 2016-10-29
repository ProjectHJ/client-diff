package kabam.rotmg.pets.view.dialogs.evolving
{
   import kabam.rotmg.pets.view.dialogs.PetDialog;
   import com.company.assembleegameclient.ui.dialogs.DialogCloser;
   import com.company.assembleegameclient.ui.dialogs.CloseDialogComponent;
   import org.osflash.signals.Signal;
   import com.company.assembleegameclient.ui.dialogs.Dialog;
   
   public class EvolveDialog extends PetDialog implements DialogCloser
   {
      
      private static const VERTICAL_SPACE:int = 6;
       
      
      public var evolveAnimation:kabam.rotmg.pets.view.dialogs.evolving.EvolveAnimation;
      
      private const closeDialogComponent:CloseDialogComponent = new CloseDialogComponent();
      
      public function EvolveDialog(param1:kabam.rotmg.pets.view.dialogs.evolving.EvolveAnimation)
      {
         this.evolveAnimation = param1;
         super("EvolveDialog.title","","ErrorDialog.ok",null,null);
         this.closeDialogComponent.add(this,Dialog.LEFT_BUTTON);
         dialogWidth = param1.width + 1;
      }
      
      override protected function makeUIAndAdd() : void
      {
         box_.addChild(this.evolveAnimation);
      }
      
      override protected function drawAdditionalUI() : void
      {
         this.evolveAnimation.x = (dialogWidth - this.evolveAnimation.width) / 2;
         this.evolveAnimation.y = titleText_.getBounds(box_).bottom + VERTICAL_SPACE;
      }
      
      override protected function drawGraphicsTemplate() : void
      {
         super.drawGraphicsTemplate();
         var _loc1_:Number = this.evolveAnimation.getBounds(rect_).bottom;
         petDialogStyler.drawLine(_loc1_);
      }
      
      public function getCloseSignal() : Signal
      {
         return this.closeDialogComponent.getCloseSignal();
      }
   }
}
