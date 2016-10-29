package com.company.assembleegameclient.mapeditor
{
   import flash.display.Sprite;
   import kabam.rotmg.core.model.PlayerModel;
   import kabam.rotmg.servers.api.Server;
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.events.Event;
   import com.company.assembleegameclient.game.events.ReconnectEvent;
   import com.company.assembleegameclient.game.events.DeathEvent;
   
   public class MapEditor extends Sprite
   {
       
      
      private var model:PlayerModel;
      
      private var server:Server;
      
      private var editingScreen_:com.company.assembleegameclient.mapeditor.EditingScreen;
      
      private var gameSprite_:GameSprite;
      
      public function MapEditor()
      {
         super();
         this.editingScreen_ = new com.company.assembleegameclient.mapeditor.EditingScreen();
         this.editingScreen_.addEventListener(MapTestEvent.MAP_TEST,this.onMapTest);
         addChild(this.editingScreen_);
      }
      
      public function initialize(param1:PlayerModel, param2:Server) : void
      {
         this.model = param1;
         this.server = param2;
      }
      
      private function onMapTest(param1:MapTestEvent) : void
      {
         removeChild(this.editingScreen_);
         this.gameSprite_ = new GameSprite(this.server,Parameters.MAPTEST_GAMEID,false,this.model.getSavedCharacters()[0].charId(),-1,null,this.model,param1.mapJSON_,false);
         this.gameSprite_.isEditor = true;
         this.gameSprite_.addEventListener(Event.COMPLETE,this.onMapTestDone);
         this.gameSprite_.addEventListener(ReconnectEvent.RECONNECT,this.onMapTestDone);
         this.gameSprite_.addEventListener(DeathEvent.DEATH,this.onMapTestDone);
         addChild(this.gameSprite_);
      }
      
      private function onMapTestDone(param1:Event) : void
      {
         this.cleanupGameSprite();
         addChild(this.editingScreen_);
      }
      
      private function onClientUpdate(param1:Event) : void
      {
         this.cleanupGameSprite();
         addChild(this.editingScreen_);
      }
      
      private function cleanupGameSprite() : void
      {
         this.gameSprite_.removeEventListener(Event.COMPLETE,this.onMapTestDone);
         this.gameSprite_.removeEventListener(ReconnectEvent.RECONNECT,this.onMapTestDone);
         this.gameSprite_.removeEventListener(DeathEvent.DEATH,this.onMapTestDone);
         removeChild(this.gameSprite_);
         this.gameSprite_ = null;
      }
   }
}
