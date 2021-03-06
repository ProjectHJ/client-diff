package kabam.rotmg.application.impl
{
   import com.company.assembleegameclient.parameters.Parameters;
   import kabam.rotmg.application.api.ApplicationSetup;
   
   public class ProductionSetup implements ApplicationSetup
   {
       
      
      private const SERVER:String = "realmofthemadgodhrd.appspot.com";
      
      private const UNENCRYPTED:String = "http://" + this.SERVER;
      
      private const ENCRYPTED:String = "https://" + this.SERVER;
      
      private const ANALYTICS:String = "UA-11236645-4";
      
      private const BUILD_LABEL:String = "RotMG #{VERSION}.{MINOR}";
      
      public function ProductionSetup()
      {
         super();
      }
      
      public function getAppEngineUrl(param1:Boolean = false) : String
      {
         return !!param1?this.UNENCRYPTED:this.ENCRYPTED;
      }
      
      public function getAnalyticsCode() : String
      {
         return this.ANALYTICS;
      }
      
      public function getBuildLabel() : String
      {
         return this.BUILD_LABEL.replace("{VERSION}",Parameters.BUILD_VERSION).replace("{MINOR}",Parameters.MINOR_VERSION);
      }
      
      public function useLocalTextures() : Boolean
      {
         return false;
      }
      
      public function isToolingEnabled() : Boolean
      {
         return false;
      }
      
      public function isGameLoopMonitored() : Boolean
      {
         return false;
      }
      
      public function useProductionDialogs() : Boolean
      {
         return true;
      }
      
      public function areErrorsReported() : Boolean
      {
         return false;
      }
      
      public function areDeveloperHotkeysEnabled() : Boolean
      {
         return false;
      }
      
      public function isDebug() : Boolean
      {
         return false;
      }
   }
}
