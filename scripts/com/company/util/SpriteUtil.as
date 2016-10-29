package com.company.util
{
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   
   public class SpriteUtil
   {
       
      
      public function SpriteUtil()
      {
         super();
      }
      
      public static function safeAddChild(param1:DisplayObjectContainer, param2:DisplayObject) : void
      {
         if(param1 != null && param2 != null && !param1.contains(param2))
         {
            param1.addChild(param2);
         }
      }
      
      public static function safeRemoveChild(param1:DisplayObjectContainer, param2:DisplayObject) : void
      {
         if(param1 != null && param2 != null && param1.contains(param2))
         {
            param1.removeChild(param2);
         }
      }
   }
}
