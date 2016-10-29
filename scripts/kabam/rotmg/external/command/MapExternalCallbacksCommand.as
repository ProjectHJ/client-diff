package kabam.rotmg.external.command
{
   import robotlegs.bender.bundles.mvcs.Command;
   import kabam.rotmg.external.service.ExternalServiceHelper;
   
   public class MapExternalCallbacksCommand extends Command
   {
       
      
      [Inject]
      public var externalServiceHelper:ExternalServiceHelper;
      
      public function MapExternalCallbacksCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.externalServiceHelper.mapExternalCallbacks();
      }
   }
}
