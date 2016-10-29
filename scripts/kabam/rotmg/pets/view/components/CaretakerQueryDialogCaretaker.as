package kabam.rotmg.pets.view.components
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import kabam.rotmg.pets.view.dialogs.CaretakerQueryDialog;
   import flash.display.BitmapData;
   
   public class CaretakerQueryDialogCaretaker extends Sprite
   {
       
      
      private const speechBubble:kabam.rotmg.pets.view.components.CaretakerQuerySpeechBubble = this.makeSpeechBubble();
      
      private const detailBubble:kabam.rotmg.pets.view.components.CaretakerQueryDetailBubble = this.makeDetailBubble();
      
      private const icon:Bitmap = this.makeCaretakerIcon();
      
      public function CaretakerQueryDialogCaretaker()
      {
         super();
      }
      
      private function makeSpeechBubble() : kabam.rotmg.pets.view.components.CaretakerQuerySpeechBubble
      {
         var _loc1_:kabam.rotmg.pets.view.components.CaretakerQuerySpeechBubble = null;
         _loc1_ = new kabam.rotmg.pets.view.components.CaretakerQuerySpeechBubble(CaretakerQueryDialog.QUERY);
         _loc1_.x = 60;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function makeDetailBubble() : kabam.rotmg.pets.view.components.CaretakerQueryDetailBubble
      {
         var _loc1_:kabam.rotmg.pets.view.components.CaretakerQueryDetailBubble = null;
         _loc1_ = new kabam.rotmg.pets.view.components.CaretakerQueryDetailBubble();
         _loc1_.y = 60;
         return _loc1_;
      }
      
      private function makeCaretakerIcon() : Bitmap
      {
         var _loc1_:Bitmap = new Bitmap(this.makeDebugBitmapData());
         _loc1_.x = -16;
         _loc1_.y = -32;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function makeDebugBitmapData() : BitmapData
      {
         return new BitmapDataSpy(42,42,true,4278255360);
      }
      
      public function showDetail(param1:String) : void
      {
         this.detailBubble.setText(param1);
         removeChild(this.speechBubble);
         addChild(this.detailBubble);
      }
      
      public function showSpeech() : void
      {
         removeChild(this.detailBubble);
         addChild(this.speechBubble);
      }
      
      public function setCaretakerIcon(param1:BitmapData) : void
      {
         this.icon.bitmapData = param1;
      }
   }
}
