package kabam.rotmg.arena.model
{
   public class ArenaLeaderboardFilter
   {
       
      
      private var name:String;
      
      private var key:String;
      
      private var entries:Vector.<kabam.rotmg.arena.model.ArenaLeaderboardEntry>;
      
      public function ArenaLeaderboardFilter(param1:String, param2:String)
      {
         super();
         this.name = param1;
         this.key = param2;
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function getKey() : String
      {
         return this.key;
      }
      
      public function getEntries() : Vector.<kabam.rotmg.arena.model.ArenaLeaderboardEntry>
      {
         return this.entries;
      }
      
      public function setEntries(param1:Vector.<kabam.rotmg.arena.model.ArenaLeaderboardEntry>) : void
      {
         this.entries = param1;
      }
      
      public function hasEntries() : Boolean
      {
         return this.entries != null;
      }
      
      public function clearEntries() : void
      {
         this.entries = null;
      }
   }
}
