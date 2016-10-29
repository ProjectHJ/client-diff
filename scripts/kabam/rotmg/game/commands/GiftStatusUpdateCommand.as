package kabam.rotmg.game.commands
{
   import robotlegs.bender.bundles.mvcs.Command;
   import com.company.assembleegameclient.game.GiftStatusModel;
   
   public class GiftStatusUpdateCommand extends Command
   {
       
      
      [Inject]
      public var model:GiftStatusModel;
      
      [Inject]
      public var hasGift:Boolean;
      
      public function GiftStatusUpdateCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.model.setHasGift(this.hasGift);
      }
   }
}
