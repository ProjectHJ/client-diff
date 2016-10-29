package kabam.rotmg.news.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   
   public class NewsTickerMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.news.view.NewsTicker;
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      public function NewsTickerMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
      }
      
      override public function destroy() : void
      {
      }
   }
}
