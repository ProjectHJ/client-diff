package kabam.rotmg.arena.component
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import kabam.rotmg.arena.view.HostQueryDialog;
   import flash.display.BitmapData;
   
   public class ArenaQueryDialogHost extends Sprite
   {
       
      
      private const speechBubble:kabam.rotmg.arena.component.HostQuerySpeechBubble = this.makeSpeechBubble();
      
      private const detailBubble:kabam.rotmg.arena.component.HostQueryDetailBubble = this.makeDetailBubble();
      
      private const icon:Bitmap = this.makeHostIcon();
      
      public function ArenaQueryDialogHost()
      {
         super();
      }
      
      private function makeSpeechBubble() : kabam.rotmg.arena.component.HostQuerySpeechBubble
      {
         var _loc1_:kabam.rotmg.arena.component.HostQuerySpeechBubble = null;
         _loc1_ = new kabam.rotmg.arena.component.HostQuerySpeechBubble(HostQueryDialog.QUERY);
         _loc1_.x = 60;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function makeDetailBubble() : kabam.rotmg.arena.component.HostQueryDetailBubble
      {
         var _loc1_:kabam.rotmg.arena.component.HostQueryDetailBubble = null;
         _loc1_ = new kabam.rotmg.arena.component.HostQueryDetailBubble();
         _loc1_.y = 60;
         return _loc1_;
      }
      
      private function makeHostIcon() : Bitmap
      {
         var _loc1_:Bitmap = new Bitmap(this.makeDebugBitmapData());
         _loc1_.x = 0;
         _loc1_.y = 0;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function makeDebugBitmapData() : BitmapData
      {
         return new BitmapData(42,42,true,4278255360);
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
      
      public function setHostIcon(param1:BitmapData) : void
      {
         this.icon.bitmapData = param1;
      }
   }
}
