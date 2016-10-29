package kabam.rotmg.pets.controller
{
   import robotlegs.bender.bundles.mvcs.Command;
   import kabam.rotmg.pets.data.PetsModel;
   import kabam.rotmg.ui.model.HUDModel;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.rotmg.pets.view.dialogs.LeavePetYard;
   import kabam.rotmg.pets.data.PetYardEnum;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class UpdatePetYardCommand extends Command
   {
       
      
      [Inject]
      public var type:int;
      
      [Inject]
      public var petModel:PetsModel;
      
      [Inject]
      public var hudModel:HUDModel;
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      public function UpdatePetYardCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.petModel.setPetYardType(this.getYardTypeFromEnum());
         this.openDialog.dispatch(new LeavePetYard(this.hudModel.gameSprite));
      }
      
      private function getYardTypeFromEnum() : int
      {
         var _loc1_:String = PetYardEnum.selectByOrdinal(this.type).value;
         return ObjectLibrary.getXMLfromId(_loc1_).@type;
      }
   }
}
