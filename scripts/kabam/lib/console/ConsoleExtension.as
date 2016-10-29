package kabam.lib.console
{
   import robotlegs.bender.framework.api.IExtension;
   import flash.display.DisplayObjectContainer;
   import robotlegs.bender.framework.api.IContext;
   import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
   import kabam.lib.resizing.ResizeExtension;
   
   public class ConsoleExtension implements IExtension
   {
       
      
      [Inject]
      public var contextView:DisplayObjectContainer;
      
      public function ConsoleExtension()
      {
         super();
      }
      
      public function extend(param1:IContext) : void
      {
         param1.extend(SignalCommandMapExtension).extend(ResizeExtension).configure(ConsoleConfig);
      }
   }
}
