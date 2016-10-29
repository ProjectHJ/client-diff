package kabam.rotmg.pets.view.dialogs
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.dialogs.control.OpenDialogNoModalSignal;
   import kabam.rotmg.pets.data.PetSlotsState;
   
   public class PetPickerDialogMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.pets.view.dialogs.PetPickerDialog;
      
      [Inject]
      public var openDialog:OpenDialogNoModalSignal;
      
      [Inject]
      public var petSlotsState:PetSlotsState;
      
      public function PetPickerDialogMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.closeButton.clicked.addOnce(this.onClosed);
      }
      
      private function onClosed() : void
      {
         this.openDialog.dispatch(new this.petSlotsState.caller());
      }
   }
}
