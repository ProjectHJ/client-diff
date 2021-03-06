package com.company.assembleegameclient.screens
{
   import com.company.assembleegameclient.appengine.SavedCharactersList;
   import com.company.assembleegameclient.constants.ScreenTypes;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.googleanalytics.GA;
   import com.company.rotmg.graphics.ScreenGraphic;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import kabam.rotmg.core.model.PlayerModel;
   import kabam.rotmg.game.view.CreditDisplay;
   import kabam.rotmg.text.view.TextFieldDisplayConcrete;
   import kabam.rotmg.ui.view.components.ScreenBase;
   import org.osflash.signals.Signal;
   
   public class NewCharacterScreen extends Sprite
   {
       
      
      private var backButton_:TitleMenuOption;
      
      private var creditDisplay_:CreditDisplay;
      
      private var boxes_:Object;
      
      public var tooltip:Signal;
      
      public var close:Signal;
      
      public var selected:Signal;
      
      public var buy:Signal;
      
      private var isInitialized:Boolean = false;
      
      public function NewCharacterScreen()
      {
         this.boxes_ = {};
         super();
         this.tooltip = new Signal(Sprite);
         this.selected = new Signal(int);
         this.close = new Signal();
         this.buy = new Signal(int);
         addChild(new ScreenBase());
         addChild(new AccountScreen());
         addChild(new ScreenGraphic());
      }
      
      public function initialize(param1:PlayerModel) : void
      {
         var _loc2_:int = 0;
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:Boolean = false;
         var _loc7_:CharacterBox = null;
         if(this.isInitialized)
         {
            return;
         }
         this.isInitialized = true;
         this.backButton_ = new TitleMenuOption(ScreenTypes.BACK,36,false);
         this.backButton_.addEventListener(MouseEvent.CLICK,this.onBackClick);
         this.backButton_.setVerticalAlign(TextFieldDisplayConcrete.MIDDLE);
         addChild(this.backButton_);
         this.creditDisplay_ = new CreditDisplay();
         this.creditDisplay_.draw(param1.getCredits(),param1.getFame());
         addChild(this.creditDisplay_);
         _loc2_ = 0;
         while(_loc2_ < ObjectLibrary.playerChars_.length)
         {
            _loc3_ = ObjectLibrary.playerChars_[_loc2_];
            _loc4_ = int(_loc3_.@type);
            _loc5_ = _loc3_.@id;
            if(!param1.isClassAvailability(_loc5_,SavedCharactersList.UNAVAILABLE))
            {
               _loc6_ = param1.isClassAvailability(_loc5_,SavedCharactersList.UNRESTRICTED);
               _loc7_ = new CharacterBox(_loc3_,param1.getCharStats()[_loc4_],param1,_loc6_);
               _loc7_.x = 50 + 140 * int(_loc2_ % 5) + 70 - _loc7_.width / 2;
               _loc7_.y = 88 + 140 * int(_loc2_ / 5);
               this.boxes_[_loc4_] = _loc7_;
               _loc7_.addEventListener(MouseEvent.ROLL_OVER,this.onCharBoxOver);
               _loc7_.addEventListener(MouseEvent.ROLL_OUT,this.onCharBoxOut);
               _loc7_.characterSelectClicked_.add(this.onCharBoxClick);
               _loc7_.buyButtonClicked_.add(this.onBuyClicked);
               if(_loc4_ == 784 && !_loc7_.available_)
               {
                  _loc7_.setSale(75);
               }
               addChild(_loc7_);
            }
            _loc2_++;
         }
         this.backButton_.x = stage.stageWidth / 2 - this.backButton_.width / 2;
         this.backButton_.y = 550;
         this.creditDisplay_.x = stage.stageWidth;
         this.creditDisplay_.y = 20;
         GA.global().trackPageview("/newCharScreen");
      }
      
      private function onBackClick(param1:Event) : void
      {
         this.close.dispatch();
      }
      
      private function onCharBoxOver(param1:MouseEvent) : void
      {
         var _loc2_:CharacterBox = param1.currentTarget as CharacterBox;
         _loc2_.setOver(true);
         this.tooltip.dispatch(_loc2_.getTooltip());
      }
      
      private function onCharBoxOut(param1:MouseEvent) : void
      {
         var _loc2_:CharacterBox = param1.currentTarget as CharacterBox;
         _loc2_.setOver(false);
         this.tooltip.dispatch(null);
      }
      
      private function onCharBoxClick(param1:MouseEvent) : void
      {
         this.tooltip.dispatch(null);
         var _loc2_:CharacterBox = param1.currentTarget.parent as CharacterBox;
         if(!_loc2_.available_)
         {
            return;
         }
         var _loc3_:int = _loc2_.objectType();
         var _loc4_:String = ObjectLibrary.typeToDisplayId_[_loc3_];
         GA.global().trackEvent("character","create",_loc4_);
         this.selected.dispatch(_loc3_);
      }
      
      public function updateCreditsAndFame(param1:int, param2:int) : void
      {
         this.creditDisplay_.draw(param1,param2);
      }
      
      public function update(param1:PlayerModel) : void
      {
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:Boolean = false;
         var _loc7_:CharacterBox = null;
         var _loc2_:int = 0;
         while(_loc2_ < ObjectLibrary.playerChars_.length)
         {
            _loc3_ = ObjectLibrary.playerChars_[_loc2_];
            _loc4_ = int(_loc3_.@type);
            _loc5_ = String(_loc3_.@id);
            if(!param1.isClassAvailability(_loc5_,SavedCharactersList.UNAVAILABLE))
            {
               _loc6_ = param1.isClassAvailability(_loc5_,SavedCharactersList.UNRESTRICTED);
               _loc7_ = this.boxes_[_loc4_];
               if(_loc7_)
               {
                  _loc7_.setIsBuyButtonEnabled(true);
                  if(_loc6_ || param1.isLevelRequirementsMet(_loc4_))
                  {
                     _loc7_.unlock();
                  }
               }
            }
            _loc2_++;
         }
      }
      
      private function onBuyClicked(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:CharacterBox = param1.currentTarget.parent as CharacterBox;
         if(_loc2_ && !_loc2_.available_)
         {
            _loc3_ = int(_loc2_.playerXML_.@type);
            _loc2_.setIsBuyButtonEnabled(false);
            this.buy.dispatch(_loc3_);
         }
      }
   }
}
