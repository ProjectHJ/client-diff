package org.swiftsuspenders.dependencyproviders
{
   import org.swiftsuspenders.Injector;
   import flash.utils.Dictionary;
   import org.swiftsuspenders.InjectorError;
   import flash.utils.getQualifiedClassName;
   import org.swiftsuspenders.utils.SsInternal;
   import org.swiftsuspenders.typedescriptions.TypeDescription;
   import org.swiftsuspenders.typedescriptions.PreDestroyInjectionPoint;
   
   public class SingletonProvider implements DependencyProvider
   {
       
      
      private var _responseType:Class;
      
      private var _creatingInjector:Injector;
      
      private var _response:Object;
      
      private var _destroyed:Boolean;
      
      public function SingletonProvider(param1:Class, param2:Injector)
      {
         super();
         this._responseType = param1;
         this._creatingInjector = param2;
      }
      
      public function apply(param1:Class, param2:Injector, param3:Dictionary) : Object
      {
         return this._response = this._response || this.createResponse(this._creatingInjector);
      }
      
      private function createResponse(param1:Injector) : Object
      {
         if(this._destroyed)
         {
            throw new InjectorError("Forbidden usage of unmapped singleton provider for type " + getQualifiedClassName(this._responseType));
         }
         return param1.SsInternal::instantiateUnmapped(this._responseType);
      }
      
      public function destroy() : void
      {
         this._destroyed = true;
         if(!this._response)
         {
            return;
         }
         var _loc1_:TypeDescription = this._creatingInjector.getTypeDescription(this._responseType);
         var _loc2_:PreDestroyInjectionPoint = _loc1_.preDestroyMethods;
         while(_loc2_)
         {
            _loc2_.applyInjection(this._response,this._responseType,this._creatingInjector);
            _loc2_ = PreDestroyInjectionPoint(_loc2_.next);
         }
         this._response = null;
      }
   }
}
