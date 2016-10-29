package org.swiftsuspenders.dependencyproviders
{
   import org.swiftsuspenders.Injector;
   import flash.utils.Dictionary;
   
   public class ForwardingProvider implements org.swiftsuspenders.dependencyproviders.DependencyProvider
   {
       
      
      public var provider:org.swiftsuspenders.dependencyproviders.DependencyProvider;
      
      public function ForwardingProvider(param1:org.swiftsuspenders.dependencyproviders.DependencyProvider)
      {
         super();
         this.provider = param1;
      }
      
      public function apply(param1:Class, param2:Injector, param3:Dictionary) : Object
      {
         return this.provider.apply(param1,param2,param3);
      }
      
      public function destroy() : void
      {
         this.provider.destroy();
      }
   }
}
