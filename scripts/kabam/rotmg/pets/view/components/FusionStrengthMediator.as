package kabam.rotmg.pets.view.components
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.pets.data.PetsModel;
   import kabam.rotmg.pets.data.PetSlotsState;
   import kabam.rotmg.pets.data.FusionCalculator;
   
   public class FusionStrengthMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.pets.view.components.FusionStrength;
      
      [Inject]
      public var petsModel:PetsModel;
      
      [Inject]
      public var petSlotsState:PetSlotsState;
      
      public function FusionStrengthMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         if(!this.petSlotsState.leftSlotPetVO)
         {
            this.petSlotsState.leftSlotPetVO = this.petsModel.getActivePet();
         }
         if(this.petSlotsState.isAcceptableFuseState())
         {
            this.view.setFusionStrength(FusionCalculator.getStrengthPercentage(this.petSlotsState.leftSlotPetVO,this.petSlotsState.rightSlotPetVO));
         }
         else
         {
            this.view.reset();
         }
      }
   }
}
