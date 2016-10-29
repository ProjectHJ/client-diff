package kabam.rotmg.ui.signals
{
   import org.osflash.signals.Signal;
   import kabam.rotmg.ui.model.Key;
   
   public class HideKeySignal extends Signal
   {
      
      public static var instance:kabam.rotmg.ui.signals.HideKeySignal;
       
      
      public function HideKeySignal()
      {
         super(Key);
         instance = this;
      }
   }
}
