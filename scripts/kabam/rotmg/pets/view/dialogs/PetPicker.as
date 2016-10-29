package kabam.rotmg.pets.view.dialogs
{
   import org.osflash.signals.Signal;
   import kabam.rotmg.pets.data.PetVO;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class PetPicker extends GridList implements ClearsPetSlots
   {
       
      
      [Inject]
      public var petIconFactory:kabam.rotmg.pets.view.dialogs.PetItemFactory;
      
      public var petPicked:Signal;
      
      private var petItems:Vector.<kabam.rotmg.pets.view.dialogs.PetItem>;
      
      private var petSize:int;
      
      private var items:Vector.<kabam.rotmg.pets.view.dialogs.PetItem>;
      
      public var doDisableUsed:Boolean = true;
      
      public function PetPicker()
      {
         this.petPicked = new PetVOSignal();
         this.items = new Vector.<kabam.rotmg.pets.view.dialogs.PetItem>();
         super();
      }
      
      private static function sortByFirstAbilityPoints(param1:kabam.rotmg.pets.view.dialogs.PetItem, param2:kabam.rotmg.pets.view.dialogs.PetItem) : int
      {
         var _loc3_:int = param1.getPetVO().abilityList[0].points;
         var _loc4_:int = param2.getPetVO().abilityList[0].points;
         return _loc4_ - _loc3_;
      }
      
      public function setPets(param1:Vector.<PetVO>) : void
      {
         this.makePetItems(param1);
         this.addToGridList();
         setItems(this.items);
         this.setCorners();
      }
      
      private function addToGridList() : void
      {
         var _loc1_:kabam.rotmg.pets.view.dialogs.PetItem = null;
         for each(_loc1_ in this.petItems)
         {
            this.items.push(_loc1_);
         }
      }
      
      private function makePetItems(param1:Vector.<PetVO>) : void
      {
         var _loc2_:PetVO = null;
         this.petItems = new Vector.<kabam.rotmg.pets.view.dialogs.PetItem>();
         for each(_loc2_ in param1)
         {
            this.addPet(_loc2_);
         }
         this.petItems.sort(sortByFirstAbilityPoints);
      }
      
      private function setCorners() : void
      {
         this.setPetItemState(getTopLeft(),kabam.rotmg.pets.view.dialogs.PetItem.TOP_LEFT);
         this.setPetItemState(getTopRight(),kabam.rotmg.pets.view.dialogs.PetItem.TOP_RIGHT);
         this.setPetItemState(getBottomLeft(),kabam.rotmg.pets.view.dialogs.PetItem.BOTTOM_LEFT);
         this.setPetItemState(getBottomRight(),kabam.rotmg.pets.view.dialogs.PetItem.BOTTOM_RIGHT);
      }
      
      private function setPetItemState(param1:DisplayObject, param2:String) : void
      {
         if(param1)
         {
            PetItem(param1).setBackground(param2);
         }
      }
      
      public function setPetSize(param1:int) : void
      {
         this.petSize = param1;
      }
      
      public function getPets() : Vector.<kabam.rotmg.pets.view.dialogs.PetItem>
      {
         return this.petItems;
      }
      
      public function getPet(param1:int) : kabam.rotmg.pets.view.dialogs.PetItem
      {
         return this.petItems[param1];
      }
      
      public function filterFusible(param1:PetVO) : void
      {
         var _loc3_:PetVO = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.petItems.length)
         {
            _loc3_ = this.petItems[_loc2_].getPetVO();
            if(!this.isFusible(param1,_loc3_))
            {
               this.petItems[_loc2_].disable();
            }
            _loc2_++;
         }
      }
      
      public function filterUsedPetVO(param1:PetVO) : void
      {
         var _loc3_:PetVO = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.petItems.length)
         {
            _loc3_ = this.petItems[_loc2_].getPetVO();
            if(_loc3_.getID() == param1.getID())
            {
               this.petItems[_loc2_].disable();
            }
            _loc2_++;
         }
      }
      
      private function isFusible(param1:PetVO, param2:PetVO) : Boolean
      {
         return param1.getFamily() == param2.getFamily() && param1.getRarity() == param2.getRarity();
      }
      
      private function addPet(param1:PetVO) : void
      {
         var pet:Disableable = null;
         var pet_clickHandler:Function = null;
         var petVO:PetVO = param1;
         pet_clickHandler = function(param1:MouseEvent):void
         {
            if(pet.isEnabled())
            {
               petPicked.dispatch(petVO);
            }
         };
         pet = this.petIconFactory.create(petVO,this.petSize);
         this.petItems.push(pet);
         pet.addEventListener(MouseEvent.CLICK,pet_clickHandler);
      }
   }
}
