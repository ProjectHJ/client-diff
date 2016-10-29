package kabam.lib.console.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import flash.display.DisplayObjectContainer;
   import kabam.lib.console.signals.ToggleConsoleSignal;
   import flash.events.KeyboardEvent;
   
   public class ConsoleKeyMediator extends Mediator
   {
       
      
      private const TRIGGER:uint = 27;
      
      [Inject]
      public var view:DisplayObjectContainer;
      
      [Inject]
      public var toggle:ToggleConsoleSignal;
      
      public function ConsoleKeyMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      override public function destroy() : void
      {
         this.view.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == this.TRIGGER)
         {
            this.toggle.dispatch();
         }
      }
   }
}
