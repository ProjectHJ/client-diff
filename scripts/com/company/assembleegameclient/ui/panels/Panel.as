package com.company.assembleegameclient.ui.panels
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.game.AGameSprite;
   
   public class Panel extends Sprite
   {
      
      public static const WIDTH:int = 200 - 12;
      
      public static const HEIGHT:int = 100 - 16;
       
      
      public var gs_:AGameSprite;
      
      public function Panel(param1:AGameSprite)
      {
         super();
         this.gs_ = param1;
      }
      
      public function draw() : void
      {
      }
   }
}
