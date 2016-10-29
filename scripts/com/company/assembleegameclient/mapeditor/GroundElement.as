package com.company.assembleegameclient.mapeditor
{
   import flash.display.Shape;
   import com.company.assembleegameclient.ui.tooltip.ToolTip;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.Camera;
   import flash.geom.Rectangle;
   import com.company.assembleegameclient.map.GroundLibrary;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.map.SquareFace;
   import com.company.assembleegameclient.map.AnimateProperties;
   
   class GroundElement extends Element
   {
      
      private static const VIN:Vector.<Number> = new <Number>[0,0,0,1,0,0,1,1,0,0,1,0];
      
      private static const SCALE:Number = 0.6;
       
      
      public var groundXML_:XML;
      
      private var tileShape_:Shape;
      
      function GroundElement(param1:XML)
      {
         super(int(param1.@type));
         this.groundXML_ = param1;
         var _loc2_:Vector.<IGraphicsData> = new Vector.<IGraphicsData>();
         var _loc3_:Camera = new Camera();
         _loc3_.configure(0.5,0.5,12,Math.PI / 4,new Rectangle(-100,-100,200,200));
         var _loc4_:BitmapData = GroundLibrary.getBitmapData(type_);
         var _loc5_:SquareFace = new SquareFace(_loc4_,VIN,0,0,AnimateProperties.NO_ANIMATE,0,0);
         _loc5_.draw(_loc2_,_loc3_,0);
         this.tileShape_ = new Shape();
         this.tileShape_.graphics.drawGraphicsData(_loc2_);
         this.tileShape_.scaleX = this.tileShape_.scaleY = SCALE;
         this.tileShape_.x = WIDTH / 2;
         this.tileShape_.y = HEIGHT / 2;
         addChild(this.tileShape_);
      }
      
      override protected function getToolTip() : ToolTip
      {
         return new GroundTypeToolTip(this.groundXML_);
      }
   }
}