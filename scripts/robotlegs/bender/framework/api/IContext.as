package robotlegs.bender.framework.api
{
   import org.swiftsuspenders.Injector;
   import org.hamcrest.Matcher;
   
   public interface IContext
   {
       
      
      function get injector() : Injector;
      
      function get lifecycle() : ILifecycle;
      
      function get logLevel() : uint;
      
      function set logLevel(param1:uint) : void;
      
      function extend(... rest) : IContext;
      
      function configure(... rest) : IContext;
      
      function addConfigHandler(param1:Matcher, param2:Function) : IContext;
      
      function getLogger(param1:Object) : ILogger;
      
      function addLogTarget(param1:ILogTarget) : IContext;
      
      function detain(... rest) : IContext;
      
      function release(... rest) : IContext;
   }
}
