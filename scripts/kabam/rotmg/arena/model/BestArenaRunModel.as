package kabam.rotmg.arena.model
{
   public class BestArenaRunModel
   {
       
      
      public var entry:kabam.rotmg.arena.model.ArenaLeaderboardEntry;
      
      public function BestArenaRunModel()
      {
         this.entry = new kabam.rotmg.arena.model.ArenaLeaderboardEntry();
         super();
      }
   }
}
