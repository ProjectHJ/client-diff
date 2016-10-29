package kabam.rotmg.pets.view.components
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.pets.data.PetsModel;
   
   public class PetsTabContentMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.pets.view.components.PetsTabContentView;
      
      [Inject]
      public var model:PetsModel;
      
      public function PetsTabContentMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.init(this.model.getActivePet());
      }
      
      override public function destroy() : void
      {
      }
   }
}
