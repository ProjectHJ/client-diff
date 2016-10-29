package kabam.rotmg.account.kongregate.services
{
   import kabam.lib.tasks.BaseTask;
   import kabam.rotmg.account.core.services.LoadApiTask;
   import flash.display.LoaderInfo;
   import kabam.rotmg.account.kongregate.view.KongregateApi;
   import kabam.rotmg.core.view.Layers;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.rotmg.dialogs.control.CloseDialogsSignal;
   import flash.system.Security;
   import flash.display.DisplayObject;
   
   public class KongregateLoadApiTask extends BaseTask implements LoadApiTask
   {
       
      
      [Inject]
      public var info:LoaderInfo;
      
      [Inject]
      public var api:KongregateApi;
      
      [Inject]
      public var local:kabam.rotmg.account.kongregate.services.KongregateSharedObject;
      
      [Inject]
      public var layers:Layers;
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      [Inject]
      public var closeDialog:CloseDialogsSignal;
      
      public function KongregateLoadApiTask()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         var _loc1_:String = this.info.parameters.kongregate_api_path;
         Security.allowDomain(_loc1_);
         this.layers.api.addChild(this.api as DisplayObject);
         this.api.loaded.addOnce(this.onApiLoaded);
         this.api.load(_loc1_);
      }
      
      private function onApiLoaded() : void
      {
         completeTask(true);
      }
   }
}