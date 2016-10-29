package com.company.assembleegameclient.ui.panels
{
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.ui.board.GuildBoardWindow;
   import com.company.assembleegameclient.util.GuildUtil;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.game.GameSprite;
   import kabam.rotmg.text.model.TextKey;
   
   public class GuildBoardPanel extends ButtonPanel
   {
       
      
      public function GuildBoardPanel(param1:GameSprite)
      {
         super(param1,TextKey.GUILD_BOARD_TITLE,TextKey.PANEL_VIEW_BUTTON);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      override protected function onButtonClick(param1:MouseEvent) : void
      {
         this.openWindow();
      }
      
      private function openWindow() : void
      {
         var _loc1_:Player = gs_.map.player_;
         if(_loc1_ == null)
         {
            return;
         }
         gs_.addChild(new GuildBoardWindow(_loc1_.guildRank_ >= GuildUtil.OFFICER));
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Parameters.data_.interact && stage.focus == null)
         {
            this.openWindow();
         }
      }
   }
}