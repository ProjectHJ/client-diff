package com.company.assembleegameclient.editor
{
   public class CommandQueue
   {
       
      
      private var list_:Vector.<com.company.assembleegameclient.editor.CommandList>;
      
      private var currPos:int = 0;
      
      public function CommandQueue()
      {
         this.list_ = new Vector.<com.company.assembleegameclient.editor.CommandList>();
         super();
      }
      
      public function addCommandList(param1:com.company.assembleegameclient.editor.CommandList) : void
      {
         this.list_.length = this.currPos;
         param1.execute();
         this.list_.push(param1);
         this.currPos++;
      }
      
      public function undo() : void
      {
         if(this.currPos == 0)
         {
            return;
         }
         this.list_[--this.currPos].unexecute();
      }
      
      public function redo() : void
      {
         if(this.currPos == this.list_.length)
         {
            return;
         }
         this.list_[this.currPos++].execute();
      }
      
      public function clear() : void
      {
         this.currPos = 0;
         this.list_.length = 0;
      }
   }
}
