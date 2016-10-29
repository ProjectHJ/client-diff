package kabam.rotmg.core.view
{
   import flash.display.Sprite;
   import flash.display.DisplayObjectContainer;
   import kabam.rotmg.tooltips.view.TooltipsView;
   import kabam.rotmg.dialogs.view.DialogsView;
   
   public class Layers extends Sprite
   {
       
      
      private var menu:kabam.rotmg.core.view.ScreensView;
      
      public var overlay:DisplayObjectContainer;
      
      private var tooltips:TooltipsView;
      
      public var top:DisplayObjectContainer;
      
      public var mouseDisabledTop:DisplayObjectContainer;
      
      private var dialogs:DialogsView;
      
      public var api:DisplayObjectContainer;
      
      public var console:DisplayObjectContainer;
      
      public function Layers()
      {
         super();
         addChild(this.menu = new kabam.rotmg.core.view.ScreensView());
         addChild(this.overlay = new Sprite());
         addChild(this.top = new Sprite());
         addChild(this.mouseDisabledTop = new Sprite());
         this.mouseDisabledTop.mouseEnabled = false;
         addChild(this.dialogs = new DialogsView());
         addChild(this.tooltips = new TooltipsView());
         addChild(this.api = new Sprite());
         addChild(this.console = new Sprite());
      }
   }
}