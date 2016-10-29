package kabam.rotmg.packages.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.dialogs.control.CloseDialogsSignal;
   
   public class PackageInfoMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.packages.view.PackageInfoDialog;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      public function PackageInfoMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.closed.add(this.onClosed);
      }
      
      override public function destroy() : void
      {
         this.view.closed.remove(this.onClosed);
      }
      
      private function onClosed() : void
      {
         this.closeDialogs.dispatch();
      }
   }
}
