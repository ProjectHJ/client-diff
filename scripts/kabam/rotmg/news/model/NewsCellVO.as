package kabam.rotmg.news.model
{
   public class NewsCellVO
   {
       
      
      public var imageURL:String;
      
      public var linkDetail:String;
      
      public var headline:String;
      
      public var startDate:Number;
      
      public var endDate:Number;
      
      public var networks:Array;
      
      public var linkType:kabam.rotmg.news.model.NewsCellLinkType;
      
      public var priority:uint;
      
      public var slot:uint;
      
      public function NewsCellVO()
      {
         super();
      }
   }
}
