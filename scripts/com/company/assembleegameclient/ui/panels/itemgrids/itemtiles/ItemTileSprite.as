package com.company.assembleegameclient.ui.panels.itemgrids.itemtiles
{
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.filters.ColorMatrixFilter;
   import flash.display.Bitmap;
   import kabam.rotmg.text.view.BitmapTextFactory;
   import flash.display.BitmapData;
   import kabam.rotmg.constants.ItemConstants;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import kabam.rotmg.text.view.stringBuilder.StaticStringBuilder;
   
   public class ItemTileSprite extends Sprite
   {
      
      protected static const DIM_FILTER:Array = [new ColorMatrixFilter([0.4,0,0,0,0,0,0.4,0,0,0,0,0,0.4,0,0,0,0,0,1,0])];
      
      private static const IDENTITY_MATRIX:Matrix = new Matrix();
      
      private static const DOSE_MATRIX:Matrix = function():Matrix
      {
         var _loc1_:* = new Matrix();
         _loc1_.translate(10,5);
         return _loc1_;
      }();
       
      
      public var itemId:int;
      
      public var itemBitmap:Bitmap;
      
      private var bitmapFactory:BitmapTextFactory;
      
      public function ItemTileSprite()
      {
         super();
         this.itemBitmap = new Bitmap();
         addChild(this.itemBitmap);
         this.itemId = -1;
      }
      
      public function setDim(param1:Boolean) : void
      {
         filters = !!param1?DIM_FILTER:null;
      }
      
      public function setType(param1:int) : void
      {
         this.itemId = param1;
         this.drawTile();
      }
      
      public function drawTile() : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:XML = null;
         var _loc4_:BitmapData = null;
         var _loc1_:int = this.itemId;
         if(_loc1_ != ItemConstants.NO_ITEM)
         {
            if(_loc1_ >= 36864 && _loc1_ < 61440)
            {
               _loc1_ = 36863;
            }
            _loc2_ = ObjectLibrary.getRedrawnTextureFromType(_loc1_,80,true);
            _loc3_ = ObjectLibrary.xmlLibrary_[_loc1_];
            if(_loc3_ && _loc3_.hasOwnProperty("Doses") && this.bitmapFactory)
            {
               _loc2_ = _loc2_.clone();
               _loc4_ = this.bitmapFactory.make(new StaticStringBuilder(String(_loc3_.Doses)),12,16777215,false,IDENTITY_MATRIX,false);
               _loc2_.draw(_loc4_,DOSE_MATRIX);
            }
            if(_loc3_ && _loc3_.hasOwnProperty("Quantity") && this.bitmapFactory)
            {
               _loc2_ = _loc2_.clone();
               _loc4_ = this.bitmapFactory.make(new StaticStringBuilder(String(_loc3_.Quantity)),12,16777215,false,IDENTITY_MATRIX,false);
               _loc2_.draw(_loc4_,DOSE_MATRIX);
            }
            this.itemBitmap.bitmapData = _loc2_;
            this.itemBitmap.x = -_loc2_.width / 2;
            this.itemBitmap.y = -_loc2_.height / 2;
            visible = true;
         }
         else
         {
            visible = false;
         }
      }
      
      public function setBitmapFactory(param1:BitmapTextFactory) : void
      {
         this.bitmapFactory = param1;
      }
   }
}
