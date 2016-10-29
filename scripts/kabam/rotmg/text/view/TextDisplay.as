package kabam.rotmg.text.view
{
   import kabam.rotmg.text.model.FontModel;
   import kabam.rotmg.text.model.TextAndMapProvider;
   
   public class TextDisplay extends kabam.rotmg.text.view.TextFieldDisplayConcrete
   {
       
      
      public var text:kabam.rotmg.text.view.TextFieldDisplayConcrete;
      
      public function TextDisplay(param1:FontModel, param2:TextAndMapProvider)
      {
         super();
         setFont(param1.getFont());
         setTextField(param2.getTextField());
         setStringMap(param2.getStringMap());
      }
   }
}
