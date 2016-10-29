package kabam.rotmg.chat.control
{
   import robotlegs.bender.bundles.mvcs.Command;
   import kabam.rotmg.chat.model.TellModel;
   
   public class ClearTellModelCommand extends Command
   {
       
      
      [Inject]
      public var tellModel:TellModel;
      
      public function ClearTellModelCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.tellModel.clearRecipients();
      }
   }
}
