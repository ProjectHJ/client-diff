package kabam.rotmg.legends.model
{
   import kabam.rotmg.text.model.TextKey;
   
   public class Timespan
   {
      
      public static const WEEK:kabam.rotmg.legends.model.Timespan = new kabam.rotmg.legends.model.Timespan(TextKey.TIMESPAN_WEEK,"week");
      
      public static const MONTH:kabam.rotmg.legends.model.Timespan = new kabam.rotmg.legends.model.Timespan(TextKey.TIMESPAN_MONTH,"month");
      
      public static const ALL:kabam.rotmg.legends.model.Timespan = new kabam.rotmg.legends.model.Timespan(TextKey.TIMESPAN_ALL,"all");
      
      public static const TIMESPANS:Vector.<kabam.rotmg.legends.model.Timespan> = new <kabam.rotmg.legends.model.Timespan>[WEEK,MONTH,ALL];
       
      
      private var name:String;
      
      private var id:String;
      
      public function Timespan(param1:String, param2:String)
      {
         super();
         this.name = param1;
         this.id = param2;
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function getId() : String
      {
         return this.id;
      }
   }
}
