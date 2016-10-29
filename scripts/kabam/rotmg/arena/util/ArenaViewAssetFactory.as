package kabam.rotmg.arena.util
{
   import kabam.rotmg.text.view.TextFieldDisplayConcrete;
   import flash.filters.DropShadowFilter;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class ArenaViewAssetFactory
   {
       
      
      public function ArenaViewAssetFactory()
      {
         super();
      }
      
      public static function returnTextfield(param1:int, param2:int, param3:Boolean, param4:Boolean = false) : TextFieldDisplayConcrete
      {
         var _loc5_:TextFieldDisplayConcrete = new TextFieldDisplayConcrete();
         _loc5_.setSize(param2).setColor(param1).setBold(param3);
         _loc5_.setVerticalAlign(TextFieldDisplayConcrete.BOTTOM);
         _loc5_.filters = !!param4?[new DropShadowFilter(0,0,0)]:[];
         return _loc5_;
      }
      
      public static function returnHostBitmap(param1:uint) : Bitmap
      {
         return new Bitmap(ObjectLibrary.getRedrawnTextureFromType(param1,80,true));
      }
   }
}
