package kabam.lib.console.view
{
   import flash.display.Sprite;
   
   public final class ConsoleView extends Sprite
   {
       
      
      public var output:kabam.lib.console.view.ConsoleOutputView;
      
      public var input:kabam.lib.console.view.ConsoleInputView;
      
      public function ConsoleView()
      {
         super();
         addChild(this.output = new kabam.lib.console.view.ConsoleOutputView());
         addChild(this.input = new kabam.lib.console.view.ConsoleInputView());
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(param1 && stage)
         {
            stage.focus = this.input;
         }
      }
   }
}
