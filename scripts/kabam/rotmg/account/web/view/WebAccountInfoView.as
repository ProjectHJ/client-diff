package kabam.rotmg.account.web.view
{
   import flash.display.Sprite;
   import kabam.rotmg.account.core.view.AccountInfoView;
   import org.osflash.signals.Signal;
   import kabam.rotmg.text.view.TextFieldDisplayConcrete;
   import com.company.assembleegameclient.screens.TitleMenuOption;
   import org.osflash.signals.natives.NativeMappedSignal;
   import flash.events.MouseEvent;
   import kabam.rotmg.text.view.stringBuilder.LineBuilder;
   import kabam.rotmg.text.model.TextKey;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import flash.display.DisplayObject;
   import kabam.rotmg.text.view.stringBuilder.StaticStringBuilder;
   
   public class WebAccountInfoView extends Sprite implements AccountInfoView
   {
      
      private static const FONT_SIZE:int = 18;
       
      
      private var _login:Signal;
      
      private var _register:Signal;
      
      private var userName:String = "";
      
      private var isRegistered:Boolean;
      
      private var accountText:TextFieldDisplayConcrete;
      
      private var registerButton:TitleMenuOption;
      
      private var loginButton:TitleMenuOption;
      
      public function WebAccountInfoView()
      {
         super();
         this.makeUIElements();
         this.makeSignals();
      }
      
      public function get login() : Signal
      {
         return this._login;
      }
      
      public function get register() : Signal
      {
         return this._register;
      }
      
      private function makeUIElements() : void
      {
         this.makeAccountText();
         this.makeLoginButton();
         this.makeRegisterButton();
      }
      
      private function makeSignals() : void
      {
         this._login = new NativeMappedSignal(this.loginButton,MouseEvent.CLICK);
         this._register = new NativeMappedSignal(this.registerButton,MouseEvent.CLICK);
      }
      
      private function makeAccountText() : void
      {
         this.accountText = this.makeTextFieldConcrete();
         this.accountText.setStringBuilder(new LineBuilder().setParams(TextKey.GUEST_ACCOUNT));
      }
      
      private function makeTextFieldConcrete() : TextFieldDisplayConcrete
      {
         var _loc1_:TextFieldDisplayConcrete = new TextFieldDisplayConcrete();
         _loc1_.setAutoSize(TextFieldAutoSize.RIGHT);
         _loc1_.setSize(FONT_SIZE).setColor(11776947);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         return _loc1_;
      }
      
      private function makeLoginButton() : void
      {
         this.loginButton = new TitleMenuOption(TextKey.LOG_IN,FONT_SIZE,false);
         this.loginButton.setAutoSize(TextFieldAutoSize.RIGHT);
      }
      
      private function makeRegisterButton() : void
      {
         this.registerButton = new TitleMenuOption(TextKey.REGISTER,FONT_SIZE,false);
         this.registerButton.setAutoSize(TextFieldAutoSize.RIGHT);
      }
      
      private function makeDividerText() : DisplayObject
      {
         var _loc1_:TextFieldDisplayConcrete = new TextFieldDisplayConcrete();
         _loc1_.setColor(11776947).setAutoSize(TextFieldAutoSize.RIGHT).setSize(FONT_SIZE);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         _loc1_.setStringBuilder(new StaticStringBuilder(" - "));
         return _loc1_;
      }
      
      public function setInfo(param1:String, param2:Boolean) : void
      {
         this.userName = param1;
         this.isRegistered = param2;
         this.updateUI();
      }
      
      private function updateUI() : void
      {
         this.removeUIElements();
         if(this.isRegistered)
         {
            this.showUIForRegisteredAccount();
         }
         else
         {
            this.showUIForGuestAccount();
         }
      }
      
      private function removeUIElements() : void
      {
         while(numChildren)
         {
            removeChildAt(0);
         }
      }
      
      private function showUIForRegisteredAccount() : void
      {
         this.accountText.setStringBuilder(new LineBuilder().setParams(TextKey.LOGGED_IN_TEXT,{"userName":this.userName}));
         this.loginButton.setTextKey(TextKey.LOG_OUT);
         this.addAndAlignHorizontally(this.accountText,this.loginButton);
      }
      
      private function showUIForGuestAccount() : void
      {
         this.accountText.setStringBuilder(new LineBuilder().setParams(TextKey.GUEST_ACCOUNT,{"userName":this.userName}));
         this.loginButton.setTextKey(TextKey.LOG_IN);
         this.addAndAlignHorizontally(this.accountText,this.makeDividerText(),this.registerButton,this.makeDividerText(),this.loginButton);
      }
      
      private function addAndAlignHorizontally(... rest) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         for each(_loc2_ in rest)
         {
            addChild(_loc2_);
         }
         _loc3_ = 0;
         _loc4_ = rest.length;
         while(_loc4_--)
         {
            _loc5_ = rest[_loc4_];
            _loc5_.x = _loc3_;
            _loc3_ = _loc3_ - _loc5_.width;
         }
      }
   }
}
