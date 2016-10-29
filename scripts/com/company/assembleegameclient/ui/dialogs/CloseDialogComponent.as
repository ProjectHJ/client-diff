package com.company.assembleegameclient.ui.dialogs
{
   import org.osflash.signals.Signal;
   import flash.events.Event;
   
   public class CloseDialogComponent
   {
       
      
      private const closeSignal:Signal = new Signal();
      
      private var dialog:com.company.assembleegameclient.ui.dialogs.DialogCloser;
      
      private var types:Vector.<String>;
      
      public function CloseDialogComponent()
      {
         this.types = new Vector.<String>();
         super();
      }
      
      public function add(param1:com.company.assembleegameclient.ui.dialogs.DialogCloser, param2:String) : void
      {
         this.dialog = param1;
         this.types.push(param2);
         param1.addEventListener(param2,this.onButtonType);
      }
      
      private function onButtonType(param1:Event) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in this.types)
         {
            this.dialog.removeEventListener(_loc2_,this.onButtonType);
         }
         this.dialog.getCloseSignal().dispatch();
      }
      
      public function getCloseSignal() : Signal
      {
         return this.closeSignal;
      }
   }
}