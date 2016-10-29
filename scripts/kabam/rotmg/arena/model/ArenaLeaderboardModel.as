package kabam.rotmg.arena.model
{
   import kabam.rotmg.text.model.TextKey;
   
   public class ArenaLeaderboardModel
   {
      
      public static const FILTERS:Vector.<kabam.rotmg.arena.model.ArenaLeaderboardFilter> = Vector.<kabam.rotmg.arena.model.ArenaLeaderboardFilter>([new kabam.rotmg.arena.model.ArenaLeaderboardFilter(TextKey.ARENA_LEADERBOARD_ALLTIME,"alltime"),new kabam.rotmg.arena.model.ArenaLeaderboardFilter(TextKey.ARENA_LEADERBOARD_WEEKLY,"weekly"),new kabam.rotmg.arena.model.ArenaLeaderboardFilter(TextKey.ARENA_LEADERBOARD_YOURRANK,"personal")]);
       
      
      public function ArenaLeaderboardModel()
      {
         super();
      }
      
      public function clearFilters() : void
      {
         var _loc1_:kabam.rotmg.arena.model.ArenaLeaderboardFilter = null;
         for each(_loc1_ in FILTERS)
         {
            _loc1_.clearEntries();
         }
      }
   }
}
