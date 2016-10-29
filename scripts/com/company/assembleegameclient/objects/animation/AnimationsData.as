package com.company.assembleegameclient.objects.animation
{
   public class AnimationsData
   {
       
      
      public var animations:Vector.<com.company.assembleegameclient.objects.animation.AnimationData>;
      
      public function AnimationsData(param1:XML)
      {
         var _loc2_:XML = null;
         this.animations = new Vector.<com.company.assembleegameclient.objects.animation.AnimationData>();
         super();
         for each(_loc2_ in param1.Animation)
         {
            this.animations.push(new com.company.assembleegameclient.objects.animation.AnimationData(_loc2_));
         }
      }
   }
}
