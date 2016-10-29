package com.company.assembleegameclient.mapeditor
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.ui.Scrollbar;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import com.company.util.GraphicsUtil;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   
   class Chooser extends Sprite
   {
      
      public static const WIDTH:int = 136;
      
      public static const HEIGHT:int = 480;
      
      private static const SCROLLBAR_WIDTH:int = 20;
       
      
      public var layer_:int;
      
      private var elementSprite_:Sprite;
      
      public var selected_:com.company.assembleegameclient.mapeditor.Element;
      
      private var scrollBar_:Scrollbar;
      
      private var mask_:Shape;
      
      private var elements_:Vector.<com.company.assembleegameclient.mapeditor.Element>;
      
      private var outlineFill_:GraphicsSolidFill;
      
      private var lineStyle_:GraphicsStroke;
      
      private var backgroundFill_:GraphicsSolidFill;
      
      private var path_:GraphicsPath;
      
      private const graphicsData_:Vector.<IGraphicsData> = new <IGraphicsData>[this.lineStyle_,this.backgroundFill_,this.path_,GraphicsUtil.END_FILL,GraphicsUtil.END_STROKE];
      
      function Chooser(param1:int)
      {
         this.elements_ = new Vector.<com.company.assembleegameclient.mapeditor.Element>();
         this.outlineFill_ = new GraphicsSolidFill(16777215,1);
         this.lineStyle_ = new GraphicsStroke(1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this.outlineFill_);
         this.backgroundFill_ = new GraphicsSolidFill(3552822,1);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         super();
         this.layer_ = param1;
         this.drawBackground();
         this.elementSprite_ = new Sprite();
         this.elementSprite_.x = 4;
         this.elementSprite_.y = 6;
         addChild(this.elementSprite_);
         this.scrollBar_ = new Scrollbar(SCROLLBAR_WIDTH,HEIGHT - 8,0.1,this);
         this.scrollBar_.x = WIDTH - SCROLLBAR_WIDTH - 6;
         this.scrollBar_.y = 4;
         this.scrollBar_.addEventListener(Event.CHANGE,this.onScrollBarChange);
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(0);
         _loc2_.graphics.drawRect(0,2,Chooser.WIDTH - SCROLLBAR_WIDTH - 4,Chooser.HEIGHT - 4);
         addChild(_loc2_);
         this.elementSprite_.mask = _loc2_;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function selectedType() : int
      {
         return this.selected_.type_;
      }
      
      public function setSelectedType(param1:int) : void
      {
         var _loc2_:com.company.assembleegameclient.mapeditor.Element = null;
         for each(_loc2_ in this.elements_)
         {
            if(_loc2_.type_ == param1)
            {
               this.setSelected(_loc2_);
               return;
            }
         }
      }
      
      protected function addElement(param1:com.company.assembleegameclient.mapeditor.Element) : void
      {
         var _loc2_:int = 0;
         _loc2_ = this.elements_.length;
         param1.x = _loc2_ % 2 == 0?Number(0):Number(2 + com.company.assembleegameclient.mapeditor.Element.WIDTH);
         param1.y = int(_loc2_ / 2) * com.company.assembleegameclient.mapeditor.Element.HEIGHT + 6;
         this.elementSprite_.addChild(param1);
         if(_loc2_ == 0)
         {
            this.setSelected(param1);
         }
         param1.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.elements_.push(param1);
      }
      
      protected function onMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:com.company.assembleegameclient.mapeditor.Element = param1.currentTarget as com.company.assembleegameclient.mapeditor.Element;
         this.setSelected(_loc2_);
      }
      
      protected function setSelected(param1:com.company.assembleegameclient.mapeditor.Element) : void
      {
         if(this.selected_ != null)
         {
            this.selected_.setSelected(false);
         }
         this.selected_ = param1;
         this.selected_.setSelected(true);
      }
      
      protected function onScrollBarChange(param1:Event) : void
      {
         this.elementSprite_.y = 6 - this.scrollBar_.pos() * (this.elementSprite_.height + 12 - HEIGHT);
      }
      
      protected function onAddedToStage(param1:Event) : void
      {
         this.scrollBar_.setIndicatorSize(HEIGHT,this.elementSprite_.height);
         addChild(this.scrollBar_);
      }
      
      protected function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function drawBackground() : void
      {
         GraphicsUtil.clearPath(this.path_);
         GraphicsUtil.drawCutEdgeRect(0,0,WIDTH,HEIGHT,4,[1,1,1,1],this.path_);
         graphics.drawGraphicsData(this.graphicsData_);
      }
   }
}
