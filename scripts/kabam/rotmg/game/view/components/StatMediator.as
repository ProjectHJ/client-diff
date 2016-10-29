package kabam.rotmg.game.view.components
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import flash.events.MouseEvent;
   
   public class StatMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.game.view.components.StatView;
      
      public function StatMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.mouseOut.add(this.onMouseOut);
         this.view.mouseOver.add(this.onMouseOver);
      }
      
      override public function destroy() : void
      {
         this.view.mouseOut.remove(this.onMouseOut);
         this.view.mouseOver.remove(this.onMouseOver);
         this.view.removeTooltip();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.view.addTooltip();
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this.view.removeTooltip();
      }
   }
}
