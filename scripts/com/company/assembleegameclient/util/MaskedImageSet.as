package com.company.assembleegameclient.util
{
   import flash.display.BitmapData;
   import com.company.util.ImageSet;
   
   public class MaskedImageSet
   {
       
      
      public var images_:Vector.<com.company.assembleegameclient.util.MaskedImage>;
      
      public function MaskedImageSet()
      {
         this.images_ = new Vector.<com.company.assembleegameclient.util.MaskedImage>();
         super();
      }
      
      public function addFromBitmapData(param1:BitmapData, param2:BitmapData, param3:int, param4:int) : void
      {
         var _loc5_:ImageSet = new ImageSet();
         _loc5_.addFromBitmapData(param1,param3,param4);
         var _loc6_:ImageSet = null;
         if(param2 != null)
         {
            _loc6_ = new ImageSet();
            _loc6_.addFromBitmapData(param2,param3,param4);
         }
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.images_.length)
         {
            this.images_.push(new com.company.assembleegameclient.util.MaskedImage(_loc5_.images_[_loc7_],_loc6_ == null?null:_loc6_.images_[_loc7_]));
            _loc7_++;
         }
      }
      
      public function addFromMaskedImage(param1:com.company.assembleegameclient.util.MaskedImage, param2:int, param3:int) : void
      {
         this.addFromBitmapData(param1.image_,param1.mask_,param2,param3);
      }
   }
}
