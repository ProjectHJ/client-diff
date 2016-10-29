package robotlegs.bender.extensions.logging.integration
{
   import org.swiftsuspenders.dependencyproviders.DependencyProvider;
   import robotlegs.bender.framework.api.IContext;
   import org.swiftsuspenders.Injector;
   import flash.utils.Dictionary;
   
   public class LoggerProvider implements DependencyProvider
   {
       
      
      private var _context:IContext;
      
      public function LoggerProvider(param1:IContext)
      {
         super();
         this._context = param1;
      }
      
      public function apply(param1:Class, param2:Injector, param3:Dictionary) : Object
      {
         return this._context.getLogger(param1);
      }
      
      public function destroy() : void
      {
      }
   }
}
