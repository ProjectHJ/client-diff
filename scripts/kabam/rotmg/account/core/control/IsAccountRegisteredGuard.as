package kabam.rotmg.account.core.control
{
   import robotlegs.bender.framework.api.IGuard;
   import kabam.rotmg.account.core.Account;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.rotmg.account.core.view.RegisterPromptDialog;
   
   public class IsAccountRegisteredGuard implements IGuard
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      public function IsAccountRegisteredGuard()
      {
         super();
      }
      
      public function approve() : Boolean
      {
         var _loc1_:Boolean = this.account.isRegistered();
         _loc1_ || this.enterRegisterFlow();
         return _loc1_;
      }
      
      protected function getString() : String
      {
         return "";
      }
      
      private function enterRegisterFlow() : void
      {
         this.openDialog.dispatch(new RegisterPromptDialog(this.getString()));
      }
   }
}
