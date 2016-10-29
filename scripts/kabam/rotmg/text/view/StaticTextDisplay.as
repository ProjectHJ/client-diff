package kabam.rotmg.text.view
{
   import kabam.rotmg.core.StaticInjectorContext;
   import org.swiftsuspenders.Injector;
   import kabam.rotmg.text.model.FontModel;
   import kabam.rotmg.text.model.TextAndMapProvider;
   
   public class StaticTextDisplay extends TextDisplay
   {
       
      
      public function StaticTextDisplay()
      {
         var _loc1_:Injector = StaticInjectorContext.getInjector();
         super(_loc1_.getInstance(FontModel),_loc1_.getInstance(TextAndMapProvider));
      }
   }
}
