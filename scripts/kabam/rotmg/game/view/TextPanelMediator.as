package kabam.rotmg.game.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.game.model.TextPanelData;
   
   public class TextPanelMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.game.view.TextPanel;
      
      [Inject]
      public var data:TextPanelData;
      
      public function TextPanelMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.init(this.data.message);
      }
   }
}
