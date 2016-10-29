package kabam.rotmg.pets.view.components
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.rotmg.pets.data.PetsModel;
   import kabam.rotmg.account.core.Account;
   import flash.events.MouseEvent;
   import kabam.rotmg.pets.data.PetYardEnum;
   import kabam.rotmg.pets.view.dialogs.CaretakerQueryDialog;
   import kabam.rotmg.pets.view.YardUpgraderView;
   
   public class YardUpgraderPanelMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.pets.view.components.YardUpgraderPanel;
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      [Inject]
      public var petModel:PetsModel;
      
      [Inject]
      public var account:Account;
      
      public function YardUpgraderPanelMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.init(this.doShowUpgradeButton());
         this.setEventListeners();
      }
      
      private function setEventListeners() : void
      {
         if(this.view.upgradeYardButton)
         {
            this.view.upgradeYardButton.addEventListener(MouseEvent.CLICK,this.onButtonLeftClick);
            this.view.infoButton.addEventListener(MouseEvent.CLICK,this.onButtonRightClick);
         }
         else
         {
            this.view.infoButton.addEventListener(MouseEvent.CLICK,this.onButtonRightClick);
         }
      }
      
      private function doShowUpgradeButton() : Boolean
      {
         var _loc1_:int = 0;
         if(!this.account.isRegistered())
         {
            return false;
         }
         _loc1_ = this.petModel.getPetYardType();
         return _loc1_ < PetYardEnum.MAX_ORDINAL;
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
      
      protected function onButtonRightClick(param1:MouseEvent) : void
      {
         this.openDialog.dispatch(new CaretakerQueryDialog());
      }
      
      protected function onButtonLeftClick(param1:MouseEvent) : void
      {
         this.openDialog.dispatch(new YardUpgraderView());
      }
   }
}