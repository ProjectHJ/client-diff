package kabam.rotmg.news.model
{
   public class NewsCellLinkType
   {
      
      public static const OPENS_LINK:kabam.rotmg.news.model.NewsCellLinkType = new kabam.rotmg.news.model.NewsCellLinkType(1);
      
      public static const OPENS_PACKAGE:kabam.rotmg.news.model.NewsCellLinkType = new kabam.rotmg.news.model.NewsCellLinkType(2);
      
      public static const OPENS_SKIN:kabam.rotmg.news.model.NewsCellLinkType = new kabam.rotmg.news.model.NewsCellLinkType(3);
      
      private static const types:Object = {
         1:OPENS_LINK,
         2:OPENS_PACKAGE,
         3:OPENS_SKIN
      };
       
      
      private var index:int;
      
      public function NewsCellLinkType(param1:int)
      {
         super();
         this.index = param1;
      }
      
      public static function parse(param1:int) : kabam.rotmg.news.model.NewsCellLinkType
      {
         return types[param1];
      }
      
      public function getIndex() : int
      {
         return this.index;
      }
   }
}
