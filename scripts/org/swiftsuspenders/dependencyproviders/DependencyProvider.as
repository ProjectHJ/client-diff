package org.swiftsuspenders.dependencyproviders
{
   import org.swiftsuspenders.Injector;
   import flash.utils.Dictionary;
   
   public interface DependencyProvider
   {
       
      
      function apply(param1:Class, param2:Injector, param3:Dictionary) : Object;
      
      function destroy() : void;
   }
}
