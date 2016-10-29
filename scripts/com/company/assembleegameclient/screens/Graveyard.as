package com.company.assembleegameclient.screens
{
   import flash.display.Sprite;
   import kabam.rotmg.core.model.PlayerModel;
   import com.company.assembleegameclient.appengine.SavedNewsItem;
   
   public class Graveyard extends Sprite
   {
       
      
      private var lines_:Vector.<com.company.assembleegameclient.screens.GraveyardLine>;
      
      private var hasCharacters_:Boolean = false;
      
      public function Graveyard(param1:PlayerModel)
      {
         var _loc2_:SavedNewsItem = null;
         this.lines_ = new Vector.<com.company.assembleegameclient.screens.GraveyardLine>();
         super();
         for each(_loc2_ in param1.getNews())
         {
            if(_loc2_.isCharDeath())
            {
               this.addLine(new com.company.assembleegameclient.screens.GraveyardLine(_loc2_.getIcon(),_loc2_.title_,_loc2_.tagline_,_loc2_.link_,_loc2_.date_,param1.getAccountId()));
               this.hasCharacters_ = true;
            }
         }
      }
      
      public function hasCharacters() : Boolean
      {
         return this.hasCharacters_;
      }
      
      public function addLine(param1:com.company.assembleegameclient.screens.GraveyardLine) : void
      {
         param1.y = 4 + this.lines_.length * (com.company.assembleegameclient.screens.GraveyardLine.HEIGHT + 4);
         this.lines_.push(param1);
         addChild(param1);
      }
   }
}
