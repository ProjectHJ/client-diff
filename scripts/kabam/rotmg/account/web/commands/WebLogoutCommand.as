package kabam.rotmg.account.web.commands
{
   import kabam.rotmg.account.core.Account;
   import kabam.rotmg.core.signals.InvalidateDataSignal;
   import kabam.rotmg.core.signals.SetScreenWithValidDataSignal;
   import kabam.rotmg.core.model.ScreenModel;
   import kabam.rotmg.packages.services.GetPackagesTask;
   import kabam.rotmg.pets.data.PetsModel;
   import kabam.lib.tasks.BaseTask;
   import flash.display.Sprite;
   import kabam.rotmg.fame.view.FameView;
   import com.company.assembleegameclient.screens.CharacterSelectionAndNewsScreen;
   
   public class WebLogoutCommand
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var invalidate:InvalidateDataSignal;
      
      [Inject]
      public var setScreenWithValidData:SetScreenWithValidDataSignal;
      
      [Inject]
      public var screenModel:ScreenModel;
      
      [Inject]
      public var getPackageTask:GetPackagesTask;
      
      [Inject]
      public var petsModel:PetsModel;
      
      public function WebLogoutCommand()
      {
         super();
      }
      
      public function execute() : void
      {
         this.account.clear();
         this.invalidate.dispatch();
         this.petsModel.clearPets();
         this.getPackageTask.finished.addOnce(this.onFinished);
         this.getPackageTask.start();
      }
      
      private function onFinished(param1:BaseTask, param2:Boolean, param3:String) : void
      {
         this.setScreenWithValidData.dispatch(this.makeScreen());
      }
      
      private function makeScreen() : Sprite
      {
         if(this.screenModel.getCurrentScreenType() == FameView)
         {
            return new CharacterSelectionAndNewsScreen();
         }
         return new (this.screenModel.getCurrentScreenType() || CharacterSelectionAndNewsScreen)();
      }
   }
}