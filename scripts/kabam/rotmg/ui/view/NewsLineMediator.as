package kabam.rotmg.ui.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import com.company.assembleegameclient.screens.GraveyardLine;
   import kabam.rotmg.fame.control.ShowFameViewSignal;
   import kabam.rotmg.fame.model.SimpleFameVO;
   
   public class NewsLineMediator extends Mediator
   {
       
      
      [Inject]
      public var view:GraveyardLine;
      
      [Inject]
      public var showFameView:ShowFameViewSignal;
      
      public function NewsLineMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.viewCharacterFame.add(this.onViewFame);
      }
      
      override public function destroy() : void
      {
         this.view.viewCharacterFame.remove(this.onViewFame);
      }
      
      private function onViewFame(param1:int) : void
      {
         this.showFameView.dispatch(new SimpleFameVO(this.view.accountId,param1));
      }
   }
}
