package robotlegs.bender.extensions.mediatorMap.api
{
   import flash.events.Event;
   
   public class MediatorFactoryEvent extends Event
   {
      
      public static const MEDIATOR_CREATE:String = "mediatorCreate";
      
      public static const MEDIATOR_REMOVE:String = "mediatorRemove";
       
      
      private var _mediator:Object;
      
      private var _view:Object;
      
      private var _mapping:robotlegs.bender.extensions.mediatorMap.api.IMediatorMapping;
      
      private var _factory:robotlegs.bender.extensions.mediatorMap.api.IMediatorFactory;
      
      public function MediatorFactoryEvent(param1:String, param2:Object, param3:Object, param4:robotlegs.bender.extensions.mediatorMap.api.IMediatorMapping, param5:robotlegs.bender.extensions.mediatorMap.api.IMediatorFactory)
      {
         super(param1);
         this._mediator = param2;
         this._view = param3;
         this._mapping = param4;
         this._factory = param5;
      }
      
      public function get mediator() : Object
      {
         return this._mediator;
      }
      
      public function get view() : Object
      {
         return this._view;
      }
      
      public function get mapping() : robotlegs.bender.extensions.mediatorMap.api.IMediatorMapping
      {
         return this._mapping;
      }
      
      public function get factory() : robotlegs.bender.extensions.mediatorMap.api.IMediatorFactory
      {
         return this._factory;
      }
      
      override public function clone() : Event
      {
         return new MediatorFactoryEvent(type,this._mediator,this._view,this._mapping,this._factory);
      }
   }
}
