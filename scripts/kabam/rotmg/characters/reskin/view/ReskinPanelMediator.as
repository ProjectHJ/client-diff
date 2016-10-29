package kabam.rotmg.characters.reskin.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.characters.reskin.control.OpenReskinDialogSignal;
   
   public class ReskinPanelMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.characters.reskin.view.ReskinPanel;
      
      [Inject]
      public var openReskinDialog:OpenReskinDialogSignal;
      
      public function ReskinPanelMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.reskin.add(this.onReskin);
      }
      
      override public function destroy() : void
      {
         this.view.reskin.remove(this.onReskin);
      }
      
      private function onReskin() : void
      {
         this.openReskinDialog.dispatch();
      }
   }
}
