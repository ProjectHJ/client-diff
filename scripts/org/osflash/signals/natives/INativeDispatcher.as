package org.osflash.signals.natives
{
   import org.osflash.signals.IPrioritySignal;
   import flash.events.IEventDispatcher;
   import flash.events.Event;
   
   public interface INativeDispatcher extends IPrioritySignal
   {
       
      
      function get eventType() : String;
      
      function get eventClass() : Class;
      
      function get target() : IEventDispatcher;
      
      function set target(param1:IEventDispatcher) : void;
      
      function dispatchEvent(param1:Event) : Boolean;
   }
}
