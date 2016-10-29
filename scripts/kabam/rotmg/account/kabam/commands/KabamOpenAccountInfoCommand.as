package kabam.rotmg.account.kabam.commands
{
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.rotmg.account.kabam.view.KabamAccountDetailDialog;
   
   public class KabamOpenAccountInfoCommand
   {
       
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      public function KabamOpenAccountInfoCommand()
      {
         super();
      }
      
      public function execute() : void
      {
         this.openDialog.dispatch(new KabamAccountDetailDialog());
      }
   }
}
