package kabam.rotmg.arena.control
{
   import robotlegs.bender.bundles.mvcs.Command;
   import kabam.rotmg.arena.model.CurrentArenaRunModel;
   import kabam.rotmg.game.model.GameModel;
   
   public class ArenaDeathCommand extends Command
   {
       
      
      [Inject]
      public var model:CurrentArenaRunModel;
      
      [Inject]
      public var gameModel:GameModel;
      
      public function ArenaDeathCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.model.died = true;
      }
   }
}
