package kabam.rotmg.promotions.view
{
   import kabam.rotmg.packages.view.BasePackageButton;
   import org.osflash.signals.Signal;
   import kabam.rotmg.text.view.TextFieldDisplayConcrete;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import kabam.rotmg.text.view.stringBuilder.StaticStringBuilder;
   import kabam.rotmg.ui.UIUtils;
   import org.osflash.signals.natives.NativeMappedSignal;
   import flash.events.MouseEvent;
   
   public class BeginnersPackageButton extends BasePackageButton
   {
      
      private static const FONT_SIZE:int = 16;
       
      
      public var clicked:Signal;
      
      private var timeLeftText:TextFieldDisplayConcrete;
      
      private var lootIcon:DisplayObject;
      
      private var daysRemaining:int = -1;
      
      private var clickArea:Sprite;
      
      public function BeginnersPackageButton()
      {
         super();
         this.clickArea = UIUtils.makeStaticHUDBackground();
         this.clicked = new NativeMappedSignal(this,MouseEvent.CLICK);
         tabChildren = false;
         tabEnabled = false;
         this.makeUI();
      }
      
      public function setDaysRemaining(param1:int) : void
      {
         if(this.daysRemaining != param1)
         {
            this.daysRemaining = param1;
            this.updateTimeLeftPosition();
         }
      }
      
      public function destroy() : void
      {
         parent.removeChild(this);
      }
      
      private function makeUI() : void
      {
         addChild(this.clickArea);
         this.lootIcon = makeIcon();
         addChild(this.lootIcon);
         this.makeTimeLeftText();
         this.setDaysRemaining(0);
      }
      
      private function makeTimeLeftText() : void
      {
         this.timeLeftText = new TextFieldDisplayConcrete().setSize(FONT_SIZE).setColor(16777215);
         this.timeLeftText.filters = [new DropShadowFilter(0,0,0)];
         this.updateTimeLeftPosition();
         addChild(this.timeLeftText);
      }
      
      private function updateTimeLeftPosition() : void
      {
         this.timeLeftText.textChanged.addOnce(this.onTextChanged);
         this.timeLeftText.setStringBuilder(new StaticStringBuilder(this.daysRemaining.toString() + " day" + (this.daysRemaining > 1?"s":"")));
      }
      
      private function onTextChanged() : void
      {
         positionText(this.lootIcon,this.timeLeftText);
      }
   }
}
