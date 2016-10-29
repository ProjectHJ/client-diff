package kabam.rotmg.account.core.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.account.core.Account;
   import kabam.rotmg.account.core.signals.UpdateAccountInfoSignal;
   import kabam.rotmg.account.web.WebAccount;
   
   public class AccountInfoMediator extends Mediator
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var view:kabam.rotmg.account.core.view.AccountInfoView;
      
      [Inject]
      public var update:UpdateAccountInfoSignal;
      
      public function AccountInfoMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.setInfo(this.account.getUserName(),this.account.isRegistered());
         this.updateDisplayName();
         this.update.add(this.updateLogin);
      }
      
      private function updateDisplayName() : *
      {
         var _loc1_:WebAccount = null;
         if(this.account is WebAccount)
         {
            _loc1_ = this.account as WebAccount;
            if(_loc1_ != null && _loc1_.userDisplayName != null && _loc1_.userDisplayName.length > 0)
            {
               this.view.setInfo(_loc1_.userDisplayName,this.account.isRegistered());
            }
         }
      }
      
      override public function destroy() : void
      {
         this.update.remove(this.updateLogin);
      }
      
      private function updateLogin() : void
      {
         this.view.setInfo(this.account.getUserName(),this.account.isRegistered());
         this.updateDisplayName();
      }
   }
}
