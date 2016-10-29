package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.FileReference;
   import com.adobe.images.PNGEncoder;
   import flash.display.BitmapData;
   
   public class PicView extends Sprite
   {
       
      
      private var bitmap_:Bitmap;
      
      private var saveButton_:com.company.assembleegameclient.ui.DeprecatedTextButton;
      
      private var closeButton_:com.company.assembleegameclient.ui.DeprecatedTextButton;
      
      public function PicView(param1:BitmapData)
      {
         super();
         this.bitmap_ = new Bitmap(param1);
         addChild(this.bitmap_);
         this.saveButton_ = new com.company.assembleegameclient.ui.DeprecatedTextButton(16,"Save");
         addChild(this.saveButton_);
         this.closeButton_ = new com.company.assembleegameclient.ui.DeprecatedTextButton(16,"Close");
         addChild(this.closeButton_);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.saveButton_.addEventListener(MouseEvent.CLICK,this.onSave);
         this.closeButton_.addEventListener(MouseEvent.CLICK,this.onClose);
         this.bitmap_.x = stage.stageHeight / 2 - this.bitmap_.width / 2;
         this.bitmap_.y = stage.stageHeight / 2 - this.bitmap_.height / 2;
         this.closeButton_.x = this.bitmap_.x + this.bitmap_.width - this.closeButton_.width;
         this.closeButton_.y = this.bitmap_.y + this.bitmap_.height + 10;
         this.saveButton_.x = this.closeButton_.x - this.saveButton_.width - 10;
         this.saveButton_.y = this.bitmap_.y + this.bitmap_.height + 10;
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this.saveButton_.removeEventListener(MouseEvent.CLICK,this.onSave);
         this.closeButton_.removeEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      private function onSave(param1:Event) : void
      {
         new FileReference().save(PNGEncoder.encode(this.bitmap_.bitmapData),"map.png");
      }
      
      private function onClose(param1:Event) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}