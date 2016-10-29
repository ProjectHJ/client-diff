package kabam.rotmg.classes.model
{
   import org.osflash.signals.Signal;
   
   public class CharacterClass
   {
       
      
      public const selected:Signal = new Signal(CharacterClass);
      
      public var id:int;
      
      public var name:String;
      
      public var description:String;
      
      public var hitSound:String;
      
      public var deathSound:String;
      
      public var bloodProb:Number;
      
      public var slotTypes:Vector.<int>;
      
      public var defaultEquipment:Vector.<int>;
      
      public var hp:kabam.rotmg.classes.model.CharacterClassStat;
      
      public var mp:kabam.rotmg.classes.model.CharacterClassStat;
      
      public var attack:kabam.rotmg.classes.model.CharacterClassStat;
      
      public var defense:kabam.rotmg.classes.model.CharacterClassStat;
      
      public var speed:kabam.rotmg.classes.model.CharacterClassStat;
      
      public var dexterity:kabam.rotmg.classes.model.CharacterClassStat;
      
      public var hpRegeneration:kabam.rotmg.classes.model.CharacterClassStat;
      
      public var mpRegeneration:kabam.rotmg.classes.model.CharacterClassStat;
      
      public var unlockCost:int;
      
      private var maxLevelAchieved:int;
      
      private var isSelected:Boolean;
      
      public const unlocks:Vector.<kabam.rotmg.classes.model.CharacterClassUnlock> = new Vector.<kabam.rotmg.classes.model.CharacterClassUnlock>(0);
      
      public const skins:kabam.rotmg.classes.model.CharacterSkins = new kabam.rotmg.classes.model.CharacterSkins();
      
      public function CharacterClass()
      {
         super();
      }
      
      public function getIsSelected() : Boolean
      {
         return this.isSelected;
      }
      
      public function setIsSelected(param1:Boolean) : void
      {
         if(this.isSelected != param1)
         {
            this.isSelected = param1;
            this.isSelected && this.selected.dispatch(this);
         }
      }
      
      public function getMaxLevelAchieved() : int
      {
         return this.maxLevelAchieved;
      }
      
      public function setMaxLevelAchieved(param1:int) : void
      {
         this.maxLevelAchieved = param1;
         this.skins.updateSkins(this.maxLevelAchieved);
      }
   }
}
