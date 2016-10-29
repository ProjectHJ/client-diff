package kabam.rotmg.account.steam.services
{
   import kabam.lib.tasks.TaskSequence;
   import kabam.rotmg.account.core.services.LoadAccountTask;
   
   public class SteamLoadAccountTask extends TaskSequence implements LoadAccountTask
   {
       
      
      [Inject]
      public var loadAPI:kabam.rotmg.account.steam.services.SteamLoadApiTask;
      
      [Inject]
      public var getCredentials:kabam.rotmg.account.steam.services.SteamGetCredentialsTask;
      
      public function SteamLoadAccountTask()
      {
         super();
      }
      
      [PostConstruct]
      public function setup() : void
      {
         add(this.loadAPI);
         add(this.getCredentials);
      }
      
      override protected function startTask() : void
      {
         super.startTask();
      }
   }
}
