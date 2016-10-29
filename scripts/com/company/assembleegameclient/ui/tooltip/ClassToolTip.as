package com.company.assembleegameclient.ui.tooltip
{
   import flash.display.Bitmap;
   import kabam.rotmg.text.view.TextFieldDisplayConcrete;
   import com.company.assembleegameclient.ui.LineBreakDesign;
   import kabam.rotmg.core.model.PlayerModel;
   import com.company.assembleegameclient.appengine.SavedCharactersList;
   import com.company.assembleegameclient.appengine.CharacterStats;
   import kabam.rotmg.text.view.stringBuilder.AppendingLineBuilder;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.AnimatedChars;
   import com.company.assembleegameclient.util.AnimatedChar;
   import com.company.assembleegameclient.util.MaskedImage;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.CachingColorTransformer;
   import flash.geom.ColorTransform;
   import kabam.rotmg.text.view.stringBuilder.LineBuilder;
   import flash.filters.DropShadowFilter;
   import kabam.rotmg.text.model.TextKey;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import kabam.rotmg.assets.services.IconFactory;
   import com.company.assembleegameclient.util.FameUtil;
   
   public class ClassToolTip extends ToolTip
   {
       
      
      private var portrait_:Bitmap;
      
      private var nameText_:TextFieldDisplayConcrete;
      
      private var descriptionText_:TextFieldDisplayConcrete;
      
      private var lineBreak_:LineBreakDesign;
      
      private var bestLevel_:TextFieldDisplayConcrete;
      
      private var toUnlockText_:TextFieldDisplayConcrete;
      
      private var unlockText_:TextFieldDisplayConcrete;
      
      private var nextClassQuest_:TextFieldDisplayConcrete;
      
      private var costText_:TextFieldDisplayConcrete;
      
      private var coinBitmap_:Bitmap;
      
      private var showUnlockRequirements:Boolean;
      
      public function ClassToolTip(param1:XML, param2:PlayerModel, param3:CharacterStats)
      {
         var _loc8_:AppendingLineBuilder = null;
         var _loc9_:XML = null;
         var _loc10_:BitmapData = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         super(3552822,1,16777215,1);
         var _loc4_:AnimatedChar = AnimatedChars.getAnimatedChar(String(param1.AnimatedTexture.File),int(param1.AnimatedTexture.Index));
         var _loc5_:MaskedImage = _loc4_.imageFromDir(AnimatedChar.RIGHT,AnimatedChar.STAND,0);
         var _loc6_:int = 4 / _loc5_.width() * 100;
         var _loc7_:BitmapData = TextureRedrawer.redraw(_loc5_.image_,_loc6_,true,0);
         this.showUnlockRequirements = this.shouldShowUnlockRequirements(param2,param1);
         if(this.showUnlockRequirements)
         {
            _loc7_ = CachingColorTransformer.transformBitmapData(_loc7_,new ColorTransform(0,0,0,0.5,0,0,0,0));
         }
         this.portrait_ = new Bitmap();
         this.portrait_.bitmapData = _loc7_;
         this.portrait_.x = -4;
         this.portrait_.y = -4;
         addChild(this.portrait_);
         this.nameText_ = new TextFieldDisplayConcrete().setSize(13).setColor(11776947);
         this.nameText_.setBold(true);
         this.nameText_.setStringBuilder(new LineBuilder().setParams(param1.DisplayId));
         this.nameText_.filters = [new DropShadowFilter(0,0,0)];
         waiter.push(this.nameText_.textChanged);
         addChild(this.nameText_);
         this.descriptionText_ = new TextFieldDisplayConcrete().setSize(13).setColor(11776947).setWordWrap(true).setMultiLine(true).setTextWidth(174);
         this.descriptionText_.setStringBuilder(new LineBuilder().setParams(param1.Description));
         this.descriptionText_.filters = [new DropShadowFilter(0,0,0)];
         waiter.push(this.descriptionText_.textChanged);
         addChild(this.descriptionText_);
         this.lineBreak_ = new LineBreakDesign(100,1842204);
         addChild(this.lineBreak_);
         if(this.showUnlockRequirements)
         {
            this.toUnlockText_ = new TextFieldDisplayConcrete().setSize(13).setColor(11776947).setTextWidth(174).setBold(true);
            this.toUnlockText_.setStringBuilder(new LineBuilder().setParams(TextKey.TO_UNLOCK));
            this.toUnlockText_.filters = [new DropShadowFilter(0,0,0)];
            waiter.push(this.toUnlockText_.textChanged);
            addChild(this.toUnlockText_);
            this.unlockText_ = new TextFieldDisplayConcrete().setSize(13).setColor(16549442).setTextWidth(174).setWordWrap(false).setMultiLine(true);
            _loc8_ = new AppendingLineBuilder();
            for each(_loc9_ in param1.UnlockLevel)
            {
               _loc11_ = ObjectLibrary.idToType_[_loc9_.toString()];
               _loc12_ = int(_loc9_.@level);
               if(param2.getBestLevel(_loc11_) < int(_loc9_.@level))
               {
                  _loc8_.pushParams(TextKey.TO_UNLOCK_REACH_LEVEL,{
                     "unlockLevel":_loc12_,
                     "typeToDisplay":ObjectLibrary.typeToDisplayId_[_loc11_]
                  });
               }
            }
            this.unlockText_.setStringBuilder(_loc8_);
            this.unlockText_.filters = [new DropShadowFilter(0,0,0)];
            waiter.push(this.unlockText_.textChanged);
            addChild(this.unlockText_);
            this.costText_ = new TextFieldDisplayConcrete().setSize(13).setColor(65280);
            this.costText_.setStringBuilder(new LineBuilder().setParams(TextKey.OR_BUY_NOW,{"unlockCost":param1.UnlockCost}));
            this.costText_.filters = [new DropShadowFilter(0,0,0)];
            waiter.push(this.costText_.textChanged);
            addChild(this.costText_);
            _loc10_ = IconFactory.makeCoin();
            this.coinBitmap_ = new Bitmap(_loc10_);
            addChild(this.coinBitmap_);
         }
         else
         {
            _loc13_ = param3 == null?0:int(param3.numStars());
            this.bestLevel_ = new TextFieldDisplayConcrete().setSize(14).setColor(6206769).setMultiLine(true);
            this.bestLevel_.setStringBuilder(new LineBuilder().setParams(TextKey.BEST_LEVEL_STATS,{
               "numStars":_loc13_,
               "bestLevel":(param3 != null?param3.bestLevel():0),
               "fame":(param3 != null?param3.bestFame():0)
            }));
            this.bestLevel_.filters = [new DropShadowFilter(0,0,0)];
            waiter.push(this.bestLevel_.textChanged);
            addChild(this.bestLevel_);
            _loc14_ = FameUtil.nextStarFame(param3 == null?0:int(param3.bestFame()),0);
            if(_loc14_ > 0)
            {
               this.nextClassQuest_ = new TextFieldDisplayConcrete().setSize(13).setColor(16549442).setTextWidth(160).setMultiLine(true).setWordWrap(true);
               this.nextClassQuest_.setStringBuilder(new LineBuilder().setParams(TextKey.NEXT_CLASS_QUEST,{
                  "nextStarFame":_loc14_,
                  "typeToDisplay":param1.DisplayId
               }));
               this.nextClassQuest_.filters = [new DropShadowFilter(0,0,0)];
               waiter.push(this.nextClassQuest_.textChanged);
               addChild(this.nextClassQuest_);
            }
         }
      }
      
      override protected function alignUI() : void
      {
         this.nameText_.x = 32;
         this.nameText_.y = 6;
         this.descriptionText_.x = 8;
         this.descriptionText_.y = 40;
         this.lineBreak_.x = 6;
         this.lineBreak_.y = height;
         if(this.showUnlockRequirements)
         {
            this.toUnlockText_.x = 8;
            this.toUnlockText_.y = height - 2;
            this.unlockText_.x = 12;
            this.unlockText_.y = height - 4;
            this.costText_.x = 12;
            this.costText_.y = height - 4;
            this.coinBitmap_.y = this.costText_.y - 2;
            this.coinBitmap_.x = this.costText_.x + this.costText_.getBounds(this.costText_).width + 4;
         }
         else
         {
            this.bestLevel_.x = 8;
            this.bestLevel_.y = height - 2;
            if(this.nextClassQuest_)
            {
               this.nextClassQuest_.x = 8;
               this.nextClassQuest_.y = height - 2;
            }
         }
         this.draw();
         position();
      }
      
      private function shouldShowUnlockRequirements(param1:PlayerModel, param2:XML) : Boolean
      {
         var _loc3_:Boolean = param1.isClassAvailability(String(param2.@id),SavedCharactersList.UNRESTRICTED);
         var _loc4_:Boolean = param1.isLevelRequirementsMet(int(param2.@type));
         return !_loc3_ && !_loc4_;
      }
      
      override public function draw() : void
      {
         this.lineBreak_.setWidthColor(width - 10,1842204);
         super.draw();
      }
   }
}
