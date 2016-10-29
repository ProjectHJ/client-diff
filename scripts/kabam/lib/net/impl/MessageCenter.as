package kabam.lib.net.impl
{
   import kabam.lib.net.api.MessageMap;
   import kabam.lib.net.api.MessageProvider;
   import org.swiftsuspenders.Injector;
   import kabam.lib.net.api.MessageMapping;
   
   public class MessageCenter implements MessageMap, MessageProvider
   {
      
      private static const MAX_ID:int = 256;
       
      
      private const maps:Vector.<kabam.lib.net.impl.MessageCenterMapping> = new Vector.<kabam.lib.net.impl.MessageCenterMapping>(MAX_ID,true);
      
      private const pools:Vector.<kabam.lib.net.impl.MessagePool> = new Vector.<kabam.lib.net.impl.MessagePool>(MAX_ID,true);
      
      private var injector:Injector;
      
      public function MessageCenter()
      {
         super();
      }
      
      public function setInjector(param1:Injector) : MessageCenter
      {
         this.injector = param1;
         return this;
      }
      
      public function map(param1:int) : MessageMapping
      {
         return this.maps[param1] = this.maps[param1] || this.makeMapping(param1);
      }
      
      public function unmap(param1:int) : void
      {
         this.pools[param1] && this.pools[param1].dispose();
         this.pools[param1] = null;
         this.maps[param1] = null;
      }
      
      private function makeMapping(param1:int) : kabam.lib.net.impl.MessageCenterMapping
      {
         return new kabam.lib.net.impl.MessageCenterMapping().setInjector(this.injector).setID(param1) as kabam.lib.net.impl.MessageCenterMapping;
      }
      
      public function require(param1:int) : Message
      {
         var _loc2_:kabam.lib.net.impl.MessagePool = this.pools[param1] = this.pools[param1] || this.makePool(param1);
         return _loc2_.require();
      }
      
      private function makePool(param1:uint) : kabam.lib.net.impl.MessagePool
      {
         var _loc2_:kabam.lib.net.impl.MessageCenterMapping = this.maps[param1];
         return !!_loc2_?_loc2_.makePool():null;
      }
   }
}
