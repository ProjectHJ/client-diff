package kabam.rotmg.ui.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.account.core.Account;
   import kabam.rotmg.account.core.services.GetOffersTask;
   import kabam.rotmg.dialogs.control.CloseDialogsSignal;
   import kabam.rotmg.account.core.signals.OpenMoneyWindowSignal;
   
   public class NotEnoughGoldMediator extends Mediator
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var getOffers:GetOffersTask;
      
      [Inject]
      public var view:kabam.rotmg.ui.view.NotEnoughGoldDialog;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var openMoneyWindow:OpenMoneyWindowSignal;
      
      public function NotEnoughGoldMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.getOffers.start();
         this.view.buyGold.add(this.onBuyGold);
         this.view.cancel.add(this.onCancel);
      }
      
      override public function destroy() : void
      {
         this.view.buyGold.remove(this.onBuyGold);
         this.view.cancel.remove(this.onCancel);
      }
      
      public function onCancel() : void
      {
         this.closeDialogs.dispatch();
      }
      
      public function onBuyGold() : void
      {
         this.openMoneyWindow.dispatch();
      }
   }
}
