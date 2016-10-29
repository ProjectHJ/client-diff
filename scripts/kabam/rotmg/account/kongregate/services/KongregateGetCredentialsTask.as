package kabam.rotmg.account.kongregate.services
{
   import kabam.lib.tasks.BaseTask;
   import kabam.rotmg.account.core.services.LoginTask;
   import kabam.rotmg.account.kongregate.view.KongregateApi;
   import kabam.rotmg.account.core.Account;
   import kabam.lib.tasks.Task;
   
   public class KongregateGetCredentialsTask extends BaseTask
   {
       
      
      [Inject]
      public var login:LoginTask;
      
      [Inject]
      public var api:KongregateApi;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var local:kabam.rotmg.account.kongregate.services.KongregateSharedObject;
      
      public function KongregateGetCredentialsTask()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         if(this.api.isGuest())
         {
            this.updateGuestAccount();
         }
         else
         {
            this.verifyCredentials();
         }
      }
      
      private function verifyCredentials() : void
      {
         this.login.finished.addOnce(this.onLogin);
         this.login.start();
      }
      
      private function onLogin(param1:Task, param2:Boolean, param3:String = "") : void
      {
         completeTask(true);
      }
      
      private function updateGuestAccount() : void
      {
         this.account.updateUser(this.local.getGuestGUID(),"","");
         completeTask(true);
      }
   }
}
