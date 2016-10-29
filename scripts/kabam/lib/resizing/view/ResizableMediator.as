package kabam.lib.resizing.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.lib.resizing.signals.Resize;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.geom.Rectangle;
   
   public class ResizableMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.lib.resizing.view.Resizable;
      
      [Inject]
      public var resize:Resize;
      
      public function ResizableMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         var _loc1_:Stage = (this.view as DisplayObject).stage;
         var _loc2_:Rectangle = new Rectangle(0,0,_loc1_.stageWidth,_loc1_.stageHeight);
         this.resize.add(this.onResize);
         this.view.resize(_loc2_);
      }
      
      override public function destroy() : void
      {
         this.resize.remove(this.onResize);
      }
      
      private function onResize(param1:Rectangle) : void
      {
         this.view.resize(param1);
      }
   }
}
