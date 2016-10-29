package kabam.rotmg.ui.model
{
   public class Key
   {
      
      public static const PURPLE:kabam.rotmg.ui.model.Key = new kabam.rotmg.ui.model.Key(0);
      
      public static const GREEN:kabam.rotmg.ui.model.Key = new kabam.rotmg.ui.model.Key(1);
      
      public static const RED:kabam.rotmg.ui.model.Key = new kabam.rotmg.ui.model.Key(2);
      
      public static const YELLOW:kabam.rotmg.ui.model.Key = new kabam.rotmg.ui.model.Key(3);
       
      
      public var position:int;
      
      public function Key(param1:int)
      {
         super();
         this.position = param1;
      }
   }
}
