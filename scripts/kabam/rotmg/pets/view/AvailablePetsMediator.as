package kabam.rotmg.pets.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.pets.controller.NotifyActivePetUpdated;
   import kabam.rotmg.pets.data.PetVO;
   
   public class AvailablePetsMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.pets.view.AvailablePetsView;
      
      [Inject]
      public var notifyActivePetUpdated:NotifyActivePetUpdated;
      
      public function AvailablePetsMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.petSelected.add(this.onPetUpdated);
         this.view.init();
      }
      
      private function onPetUpdated(param1:PetVO) : void
      {
         this.notifyActivePetUpdated.dispatch(param1);
      }
      
      override public function destroy() : void
      {
      }
   }
}
