package kabam.rotmg.questrewards
{
   import robotlegs.bender.framework.api.IConfig;
   import org.swiftsuspenders.Injector;
   import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
   import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
   import robotlegs.bender.extensions.commandCenter.api.ICommandCenter;
   import kabam.rotmg.questrewards.view.QuestRewardsPanel;
   import kabam.rotmg.questrewards.view.QuestRewardsPanelMediator;
   import kabam.rotmg.questrewards.view.QuestRewardsContainer;
   import kabam.rotmg.questrewards.view.QuestRewardsMediator;
   import kabam.rotmg.questrewards.controller.QuestFetchCompleteSignal;
   import kabam.rotmg.questrewards.controller.QuestRedeemCompleteSignal;
   import com.company.assembleegameclient.game.events.KeyInfoResponseSignal;
   
   public class QuestRewardsConfig implements IConfig
   {
       
      
      [Inject]
      public var injector:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var commandMap:ISignalCommandMap;
      
      [Inject]
      public var commandCenter:ICommandCenter;
      
      public function QuestRewardsConfig()
      {
         super();
      }
      
      public function configure() : void
      {
         this.mediatorMap.map(QuestRewardsPanel).toMediator(QuestRewardsPanelMediator);
         this.mediatorMap.map(QuestRewardsContainer).toMediator(QuestRewardsMediator);
         this.injector.map(QuestFetchCompleteSignal).asSingleton();
         this.injector.map(QuestRedeemCompleteSignal).asSingleton();
         this.injector.map(KeyInfoResponseSignal).asSingleton();
      }
   }
}
