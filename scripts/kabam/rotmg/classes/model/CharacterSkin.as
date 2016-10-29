package kabam.rotmg.classes.model
{
   import org.osflash.signals.Signal;
   import kabam.rotmg.assets.model.CharacterTemplate;
   
   public class CharacterSkin
   {
       
      
      public const changed:Signal = new Signal(CharacterSkin);
      
      public var id:int = 0;
      
      public var name:String = "";
      
      public var unlockLevel:int;
      
      public var unlockSpecial:String;
      
      public var template:CharacterTemplate;
      
      public var cost:int;
      
      public var limited:Boolean = false;
      
      public var skinSelectEnabled:Boolean = true;
      
      private var state:kabam.rotmg.classes.model.CharacterSkinState;
      
      private var isSelected:Boolean;
      
      public function CharacterSkin()
      {
         this.state = kabam.rotmg.classes.model.CharacterSkinState.NULL;
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
            this.changed.dispatch(this);
         }
      }
      
      public function getState() : kabam.rotmg.classes.model.CharacterSkinState
      {
         return this.state;
      }
      
      public function setState(param1:kabam.rotmg.classes.model.CharacterSkinState) : void
      {
         if(this.state != param1)
         {
            this.state = param1;
            this.changed.dispatch(this);
         }
      }
   }
}
