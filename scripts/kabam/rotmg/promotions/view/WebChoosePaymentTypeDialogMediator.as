package kabam.rotmg.promotions.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.promotions.model.BeginnersPackageModel;
   import kabam.rotmg.dialogs.control.CloseDialogsSignal;
   import kabam.rotmg.promotions.signals.MakeBeginnersPackagePaymentSignal;
   import kabam.rotmg.account.core.PaymentData;
   
   public class WebChoosePaymentTypeDialogMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.promotions.view.WebChoosePaymentTypeDialog;
      
      [Inject]
      public var model:BeginnersPackageModel;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var makePayment:MakeBeginnersPackagePaymentSignal;
      
      public function WebChoosePaymentTypeDialogMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.close.add(this.onClose);
         this.view.select.add(this.onSelect);
         this.view.centerOnScreen();
      }
      
      override public function destroy() : void
      {
         this.view.close.remove(this.onClose);
         this.view.select.remove(this.onSelect);
      }
      
      private function onClose() : void
      {
         this.closeDialogs.dispatch();
      }
      
      private function onSelect(param1:String) : void
      {
         var _loc2_:PaymentData = new PaymentData();
         _loc2_.offer = this.model.getOffer();
         _loc2_.paymentMethod = param1;
         this.makePayment.dispatch(_loc2_);
         this.closeDialogs.dispatch();
      }
   }
}
