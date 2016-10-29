package kabam.rotmg.classes.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.classes.model.ClassesModel;
   import kabam.rotmg.classes.model.CharacterClass;
   import flash.display.DisplayObject;
   
   public class CharacterSkinListMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.classes.view.CharacterSkinListView;
      
      [Inject]
      public var model:ClassesModel;
      
      [Inject]
      public var factory:kabam.rotmg.classes.view.CharacterSkinListItemFactory;
      
      public function CharacterSkinListMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.model.selected.add(this.setSkins);
         this.setSkins(this.model.getSelected());
      }
      
      override public function destroy() : void
      {
         this.model.selected.remove(this.setSkins);
      }
      
      private function setSkins(param1:CharacterClass) : void
      {
         var _loc2_:Vector.<DisplayObject> = this.factory.make(param1.skins);
         this.view.setItems(_loc2_);
      }
   }
}
