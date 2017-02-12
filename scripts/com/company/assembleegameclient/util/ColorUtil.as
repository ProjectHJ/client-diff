package com.company.assembleegameclient.util
{
   public class ColorUtil
   {
       
      
      public function ColorUtil()
      {
         super();
      }
      
      public static function rangeRandomSmart(param1:uint, param2:uint) : Number
      {
         var _loc3_:uint = param1 >> 16 & 255;
         var _loc4_:uint = param1 >> 8 & 255;
         var _loc5_:uint = param1 & 255;
         var _loc6_:uint = param2 >> 16 & 255;
         var _loc7_:uint = param2 >> 8 & 255;
         var _loc8_:uint = param2 & 255;
         var _loc9_:* = _loc6_ + Math.random() * (_loc3_ - _loc6_);
         var _loc10_:* = _loc7_ + Math.random() * (_loc4_ - _loc7_);
         var _loc11_:* = _loc8_ + Math.random() * (_loc5_ - _loc8_);
         return _loc9_ << 16 | _loc10_ << 8 | _loc11_;
      }
      
      public static function rangeRandomMix(param1:uint, param2:uint) : Number
      {
         var _loc3_:uint = param1 >> 16 & 255;
         var _loc4_:uint = param1 >> 8 & 255;
         var _loc5_:uint = param1 & 255;
         var _loc6_:uint = param2 >> 16 & 255;
         var _loc7_:uint = param2 >> 8 & 255;
         var _loc8_:uint = param2 & 255;
         var _loc9_:Number = Math.random();
         var _loc10_:* = _loc6_ + _loc9_ * (_loc3_ - _loc6_);
         var _loc11_:* = _loc7_ + _loc9_ * (_loc4_ - _loc7_);
         var _loc12_:* = _loc8_ + _loc9_ * (_loc5_ - _loc8_);
         return _loc10_ << 16 | _loc11_ << 8 | _loc12_;
      }
      
      public static function rangeRandom(param1:uint, param2:uint) : Number
      {
         return param2 + Math.random() * (param1 - param2);
      }
   }
}
