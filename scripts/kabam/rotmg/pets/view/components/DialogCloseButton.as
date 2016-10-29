package kabam.rotmg.pets.view.components
{
   import flash.display.Sprite;
   import org.osflash.signals.Signal;
   import flash.events.MouseEvent;
   import flash.display.DisplayObject;
   
   public class DialogCloseButton extends Sprite
   {
      
      public static var CloseButtonAsset:Class = DialogCloseButton_CloseButtonAsset;
      
      public static var CloseButtonLargeAsset:Class = DialogCloseButton_CloseButtonLargeAsset;
       
      
      public const clicked:Signal = new Signal();
      
      public var disabled:Boolean = false;
      
      public function DialogCloseButton(param1:Number = -1)
      {
         var _loc2_:DisplayObject = null;
         super();
         if(param1 < 0)
         {
            addChild(new CloseButtonAsset());
         }
         else
         {
            _loc2_ = new CloseButtonLargeAsset();
            addChild(new CloseButtonLargeAsset());
            scaleX = scaleX * param1;
            scaleY = scaleY * param1;
         }
         buttonMode = true;
         addEventListener(MouseEvent.CLICK,this.onClicked);
      }
      
      public function setDisabled(param1:Boolean) : void
      {
         this.disabled = param1;
         if(param1)
         {
            removeEventListener(MouseEvent.CLICK,this.onClicked);
         }
         else
         {
            addEventListener(MouseEvent.CLICK,this.onClicked);
         }
      }
      
      public function disableLegacyCloseBehavior() : void
      {
         this.disabled = true;
         removeEventListener(MouseEvent.CLICK,this.onClicked);
      }
      
      private function onClicked(param1:MouseEvent) : void
      {
         if(!this.disabled)
         {
            this.clicked.dispatch();
            removeEventListener(MouseEvent.CLICK,this.onClicked);
         }
      }
   }
}
