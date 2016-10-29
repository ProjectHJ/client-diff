package com.company.assembleegameclient.objects
{
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.AnimatedChar;
   import flash.utils.Dictionary;
   import com.company.assembleegameclient.objects.particles.EffectProperties;
   
   public class TextureData
   {
       
      
      public var texture_:BitmapData = null;
      
      public var mask_:BitmapData = null;
      
      public var animatedChar_:AnimatedChar = null;
      
      public var randomTextureData_:Vector.<com.company.assembleegameclient.objects.TextureData> = null;
      
      public var altTextures_:Dictionary = null;
      
      public var remoteTextureDir_:int;
      
      public var effectProps_:EffectProperties = null;
      
      public function TextureData()
      {
         super();
      }
      
      public function getTexture(param1:int = 0) : BitmapData
      {
         return null;
      }
      
      public function getAltTextureData(param1:int) : com.company.assembleegameclient.objects.TextureData
      {
         return null;
      }
   }
}
