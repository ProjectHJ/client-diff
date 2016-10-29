package com.company.assembleegameclient.ui.tooltip
{
   import flash.display.Bitmap;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.display.BitmapData;
   import com.company.util.BitmapUtil;
   
   public class PortraitToolTip extends ToolTip
   {
       
      
      private var portrait_:Bitmap;
      
      public function PortraitToolTip(param1:GameObject)
      {
         super(6036765,1,16549442,1,false);
         this.portrait_ = new Bitmap();
         this.portrait_.x = 0;
         this.portrait_.y = 0;
         var _loc2_:BitmapData = param1.getPortrait();
         _loc2_ = BitmapUtil.cropToBitmapData(_loc2_,10,10,_loc2_.width - 20,_loc2_.height - 20);
         this.portrait_.bitmapData = _loc2_;
         addChild(this.portrait_);
         filters = [];
      }
   }
}
