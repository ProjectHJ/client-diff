package kabam.rotmg.ui.commands
{
   import kabam.rotmg.account.core.Account;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import flash.display.Sprite;
   import com.company.assembleegameclient.account.ui.NewChooseNameFrame;
   import kabam.rotmg.ui.view.ChooseNameRegisterDialog;
   
   public class ChooseNameCommand
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      public function ChooseNameCommand()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:Sprite = null;
         if(this.account.isRegistered())
         {
            _loc1_ = new NewChooseNameFrame();
         }
         else
         {
            _loc1_ = new ChooseNameRegisterDialog();
         }
         this.openDialog.dispatch(_loc1_);
      }
   }
}
