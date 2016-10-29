package kabam.rotmg.application.impl
{
   import kabam.rotmg.application.api.ApplicationSetup;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class TestingSetup implements ApplicationSetup
   {
       
      
      private const SERVER:String = "rotmgtesting.appspot.com";
      
      private const UNENCRYPTED:String = "http://" + this.SERVER;
      
      private const ENCRYPTED:String = "https://" + this.SERVER;
      
      private const ANALYTICS:String = "UA-11236645-6";
      
      private const BUILD_LABEL:String = "<font color=\'#FF0000\'>TESTING</font> #{VERSION}";
      
      public function TestingSetup()
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
         var _loc1_:String = Parameters.BUILD_VERSION + "." + Parameters.MINOR_VERSION;
         return this.BUILD_LABEL.replace("{VERSION}",_loc1_);
      }
      
      public function useLocalTextures() : Boolean
      {
         return true;
      }
      
      public function isToolingEnabled() : Boolean
      {
         return true;
      }
      
      public function isGameLoopMonitored() : Boolean
      {
         return true;
      }
      
      public function areErrorsReported() : Boolean
      {
         return false;
      }
      
      public function useProductionDialogs() : Boolean
      {
         return true;
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
