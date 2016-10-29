package kabam.rotmg.pets.data
{
   public class PetYardEnum
   {
      
      public static const PET_YARD_ONE:kabam.rotmg.pets.data.PetYardEnum = new kabam.rotmg.pets.data.PetYardEnum("Yard Upgrader 1",1,kabam.rotmg.pets.data.PetRarityEnum.COMMON);
      
      public static const PET_YARD_TWO:kabam.rotmg.pets.data.PetYardEnum = new kabam.rotmg.pets.data.PetYardEnum("Yard Upgrader 2",2,kabam.rotmg.pets.data.PetRarityEnum.UNCOMMON);
      
      public static const PET_YARD_THREE:kabam.rotmg.pets.data.PetYardEnum = new kabam.rotmg.pets.data.PetYardEnum("Yard Upgrader 3",3,kabam.rotmg.pets.data.PetRarityEnum.RARE);
      
      public static const PET_YARD_FOUR:kabam.rotmg.pets.data.PetYardEnum = new kabam.rotmg.pets.data.PetYardEnum("Yard Upgrader 4",4,kabam.rotmg.pets.data.PetRarityEnum.LEGENDARY);
      
      public static const PET_YARD_FIVE:kabam.rotmg.pets.data.PetYardEnum = new kabam.rotmg.pets.data.PetYardEnum("Yard Upgrader 5",5,kabam.rotmg.pets.data.PetRarityEnum.DIVINE);
      
      public static const MAX_ORDINAL:int = 5;
       
      
      public var value:String;
      
      public var ordinal:int;
      
      public var rarity:kabam.rotmg.pets.data.PetRarityEnum;
      
      public function PetYardEnum(param1:*, param2:int, param3:kabam.rotmg.pets.data.PetRarityEnum)
      {
         super();
         this.value = param1;
         this.ordinal = param2;
         this.rarity = param3;
      }
      
      public static function get list() : Array
      {
         return [PET_YARD_ONE,PET_YARD_TWO,PET_YARD_THREE,PET_YARD_FOUR,PET_YARD_FIVE];
      }
      
      public static function selectByValue(param1:String) : kabam.rotmg.pets.data.PetYardEnum
      {
         var _loc2_:kabam.rotmg.pets.data.PetYardEnum = null;
         var _loc3_:kabam.rotmg.pets.data.PetYardEnum = null;
         for each(_loc3_ in kabam.rotmg.pets.data.PetYardEnum.list)
         {
            if(param1 == _loc3_.value)
            {
               _loc2_ = _loc3_;
            }
         }
         return _loc2_;
      }
      
      public static function selectByOrdinal(param1:int) : kabam.rotmg.pets.data.PetYardEnum
      {
         var _loc2_:kabam.rotmg.pets.data.PetYardEnum = null;
         var _loc3_:kabam.rotmg.pets.data.PetYardEnum = null;
         for each(_loc3_ in kabam.rotmg.pets.data.PetYardEnum.list)
         {
            if(param1 == _loc3_.ordinal)
            {
               _loc2_ = _loc3_;
            }
         }
         return _loc2_;
      }
   }
}
