package kabam.rotmg.ui.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.ui.signals.ShowKeySignal;
   import kabam.rotmg.ui.signals.HideKeySignal;
   import kabam.rotmg.game.signals.GameClosedSignal;
   import kabam.rotmg.ui.model.Key;
   
   public class KeysMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.ui.view.KeysView;
      
      [Inject]
      public var showKey:ShowKeySignal;
      
      [Inject]
      public var hideKey:HideKeySignal;
      
      [Inject]
      public var gameClosed:GameClosedSignal;
      
      public function KeysMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.showKey.add(this.onShowKey);
         this.hideKey.add(this.onHideKey);
         this.gameClosed.add(this.onGameClosed);
      }
      
      override public function destroy() : void
      {
         this.showKey.remove(this.onShowKey);
         this.hideKey.remove(this.onHideKey);
         this.gameClosed.remove(this.onGameClosed);
      }
      
      private function onShowKey(param1:Key) : void
      {
         this.view.showKey(param1);
      }
      
      private function onHideKey(param1:Key) : void
      {
         this.view.hideKey(param1);
      }
      
      private function onGameClosed() : void
      {
         this.view.parent.removeChild(this.view);
      }
   }
}
