package kabam.rotmg.packages.control
{
   import robotlegs.bender.bundles.mvcs.Command;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.rotmg.packages.services.PackageModel;
   import kabam.rotmg.packages.model.PackageInfo;
   import kabam.rotmg.packages.view.PackageOfferDialog;
   
   public class OpenPackageCommand extends Command
   {
       
      
      [Inject]
      public var openDialogSignal:OpenDialogSignal;
      
      [Inject]
      public var packageModel:PackageModel;
      
      [Inject]
      public var packageId:int;
      
      [Inject]
      public var alreadyBoughtPackage:kabam.rotmg.packages.control.AlreadyBoughtPackageSignal;
      
      public function OpenPackageCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:PackageInfo = null;
         if(this.packageModel.canPurchasePackage(this.packageId))
         {
            _loc1_ = this.packageModel.getPackageById(this.packageId);
            this.openDialogSignal.dispatch(new PackageOfferDialog().setPackage(_loc1_));
         }
         else
         {
            this.alreadyBoughtPackage.dispatch();
         }
      }
   }
}
