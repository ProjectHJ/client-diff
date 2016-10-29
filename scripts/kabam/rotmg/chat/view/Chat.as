package kabam.rotmg.chat.view
{
   import flash.display.Sprite;
   import kabam.rotmg.chat.model.ChatModel;
   
   public class Chat extends Sprite
   {
       
      
      public var list:kabam.rotmg.chat.view.ChatList;
      
      private var input:kabam.rotmg.chat.view.ChatInput;
      
      private var notAllowed:kabam.rotmg.chat.view.ChatInputNotAllowed;
      
      private var model:ChatModel;
      
      public function Chat()
      {
         super();
         mouseEnabled = true;
         mouseChildren = true;
         this.list = new kabam.rotmg.chat.view.ChatList();
         addChild(this.list);
      }
      
      public function setup(param1:ChatModel, param2:Boolean) : void
      {
         this.model = param1;
         this.y = 600 - param1.bounds.height;
         this.list.y = param1.bounds.height;
         if(param2)
         {
            this.addChatInput();
         }
         else
         {
            this.addInputNotAllowed();
         }
      }
      
      private function addChatInput() : void
      {
         this.input = new kabam.rotmg.chat.view.ChatInput();
         addChild(this.input);
      }
      
      private function addInputNotAllowed() : void
      {
         this.notAllowed = new kabam.rotmg.chat.view.ChatInputNotAllowed();
         addChild(this.notAllowed);
         this.list.y = this.model.bounds.height - this.model.lineHeight;
      }
      
      public function removeRegisterBlock() : void
      {
         if(this.notAllowed != null && contains(this.notAllowed))
         {
            removeChild(this.notAllowed);
         }
         if(this.input == null || !contains(this.input))
         {
            this.addChatInput();
         }
      }
   }
}
