package kabam.rotmg.pets.view.dialogs.evolving
{
   import flash.display.Sprite;
   import kabam.rotmg.pets.view.components.PetIconFactory;
   import org.swiftsuspenders.Injector;
   import flash.display.DisplayObject;
   import kabam.rotmg.pets.data.PetVO;
   
   public class EvolvedPet extends Sprite
   {
       
      
      [Inject]
      public var petIconFactory:PetIconFactory;
      
      [Inject]
      public var injector:Injector;
      
      public var littleSpinner:kabam.rotmg.pets.view.dialogs.evolving.Spinner;
      
      public var bigSpinner:kabam.rotmg.pets.view.dialogs.evolving.Spinner;
      
      public var petIcon:DisplayObject;
      
      private var petVO:PetVO;
      
      public function EvolvedPet()
      {
         super();
      }
      
      public function setPet(param1:PetVO) : void
      {
         this.petIconFactory.outlineSize = 8;
         this.petVO = param1;
         this.bigSpinner = this.addSpinner();
         this.littleSpinner = this.addSpinner();
         this.addPetIcon(param1);
         this.configureSpinners();
      }
      
      public function getPet() : PetVO
      {
         return this.petVO;
      }
      
      private function addPetIcon(param1:PetVO) : void
      {
         this.petIcon = this.petIconFactory.create(param1,120);
         this.petIcon.x = -1 * this.petIcon.width / 2;
         this.petIcon.y = -1 * this.petIcon.height / 2;
         addChild(this.petIcon);
      }
      
      private function configureSpinners() : void
      {
         this.bigSpinner.degreesPerSecond = 50;
         this.littleSpinner.degreesPerSecond = this.bigSpinner.degreesPerSecond * 1.5;
         var _loc1_:Number = 0.7;
         this.littleSpinner.width = this.bigSpinner.width * _loc1_;
         this.littleSpinner.height = this.bigSpinner.height * _loc1_;
         this.littleSpinner.alpha = this.bigSpinner.alpha = 0.7;
      }
      
      private function addSpinner() : kabam.rotmg.pets.view.dialogs.evolving.Spinner
      {
         var _loc1_:kabam.rotmg.pets.view.dialogs.evolving.Spinner = this.injector.getInstance(kabam.rotmg.pets.view.dialogs.evolving.Spinner);
         addChild(_loc1_);
         return _loc1_;
      }
   }
}
