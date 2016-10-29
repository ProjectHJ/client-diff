package kabam.rotmg.ui.signals
{
   import org.osflash.signals.Signal;
   
   public class ShowHideKeyUISignal extends Signal
   {
      
      public static var instance:kabam.rotmg.ui.signals.ShowHideKeyUISignal;
       
      
      public function ShowHideKeyUISignal()
      {
         super();
         instance = this;
      }
   }
}
