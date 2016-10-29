package com.company.assembleegameclient.editor
{
   public class CommandList
   {
       
      
      private var list_:Vector.<com.company.assembleegameclient.editor.Command>;
      
      public function CommandList()
      {
         this.list_ = new Vector.<com.company.assembleegameclient.editor.Command>();
         super();
      }
      
      public function empty() : Boolean
      {
         return this.list_.length == 0;
      }
      
      public function addCommand(param1:com.company.assembleegameclient.editor.Command) : void
      {
         this.list_.push(param1);
      }
      
      public function execute() : void
      {
         var _loc1_:com.company.assembleegameclient.editor.Command = null;
         for each(_loc1_ in this.list_)
         {
            _loc1_.execute();
         }
      }
      
      public function unexecute() : void
      {
         var _loc1_:com.company.assembleegameclient.editor.Command = null;
         for each(_loc1_ in this.list_)
         {
            _loc1_.unexecute();
         }
      }
   }
}
