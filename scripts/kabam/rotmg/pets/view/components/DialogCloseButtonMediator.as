package kabam.rotmg.pets.view.components
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.dialogs.control.CloseDialogsSignal;
   
   public class DialogCloseButtonMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.pets.view.components.DialogCloseButton;
      
      [Inject]
      public var closeDialogSignal:CloseDialogsSignal;
      
      public function DialogCloseButtonMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.clicked.addOnce(this.closeDialog);
      }
      
      private function closeDialog() : void
      {
         this.closeDialogSignal.dispatch();
      }
   }
}
