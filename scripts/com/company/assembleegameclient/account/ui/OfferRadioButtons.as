package com.company.assembleegameclient.account.ui
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.util.offer.Offers;
   import kabam.rotmg.account.core.model.MoneyConfig;
   import com.company.assembleegameclient.account.ui.components.SelectionGroup;
   import com.company.assembleegameclient.util.offer.Offer;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.account.ui.components.Selectable;
   import flash.display.DisplayObject;
   import kabam.lib.ui.impl.VerticalLayout;
   import kabam.lib.ui.api.Layout;
   
   public class OfferRadioButtons extends Sprite
   {
       
      
      private var offers:Offers;
      
      private var config:MoneyConfig;
      
      private var choices:Vector.<com.company.assembleegameclient.account.ui.OfferRadioButton>;
      
      private var group:SelectionGroup;
      
      public function OfferRadioButtons(param1:Offers, param2:MoneyConfig)
      {
         super();
         this.offers = param1;
         this.config = param2;
         this.makeGoldChoices();
         this.alignGoldChoices();
         this.makeSelectionGroup();
      }
      
      public function getChoice() : com.company.assembleegameclient.account.ui.OfferRadioButton
      {
         return this.group.getSelected() as com.company.assembleegameclient.account.ui.OfferRadioButton;
      }
      
      private function makeGoldChoices() : void
      {
         var _loc1_:int = this.offers.offerList.length;
         this.choices = new Vector.<com.company.assembleegameclient.account.ui.OfferRadioButton>(_loc1_,true);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.choices[_loc2_] = this.makeGoldChoice(this.offers.offerList[_loc2_]);
            _loc2_++;
         }
      }
      
      private function makeGoldChoice(param1:Offer) : com.company.assembleegameclient.account.ui.OfferRadioButton
      {
         var _loc2_:com.company.assembleegameclient.account.ui.OfferRadioButton = new com.company.assembleegameclient.account.ui.OfferRadioButton(param1,this.config);
         _loc2_.addEventListener(MouseEvent.CLICK,this.onSelected);
         addChild(_loc2_);
         return _loc2_;
      }
      
      private function onSelected(param1:MouseEvent) : void
      {
         var _loc2_:Selectable = param1.currentTarget as Selectable;
         this.group.setSelected(_loc2_.getValue());
      }
      
      private function alignGoldChoices() : void
      {
         var _loc1_:Vector.<DisplayObject> = this.castChoicesToDisplayList();
         var _loc2_:Layout = new VerticalLayout();
         _loc2_.setPadding(5);
         _loc2_.layout(_loc1_);
      }
      
      private function castChoicesToDisplayList() : Vector.<DisplayObject>
      {
         var _loc1_:int = this.choices.length;
         var _loc2_:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_[_loc3_] = this.choices[_loc3_];
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function makeSelectionGroup() : void
      {
         var _loc1_:Vector.<Selectable> = this.castBoxesToSelectables();
         this.group = new SelectionGroup(_loc1_);
         this.group.setSelected(this.choices[0].getValue());
      }
      
      private function castBoxesToSelectables() : Vector.<Selectable>
      {
         var _loc1_:int = this.choices.length;
         var _loc2_:Vector.<Selectable> = new Vector.<Selectable>(0);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_[_loc3_] = this.choices[_loc3_];
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function showBonuses(param1:Boolean) : void
      {
         var _loc2_:int = this.choices.length;
         while(_loc2_--)
         {
            this.choices[_loc2_].showBonus(param1);
         }
      }
   }
}
