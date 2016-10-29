package kabam.rotmg.messaging.impl.outgoing
{
   import kabam.rotmg.messaging.impl.data.WorldPosData;
   import flash.utils.IDataOutput;
   
   public class AoeAck extends OutgoingMessage
   {
       
      
      public var time_:int;
      
      public var position_:WorldPosData;
      
      public function AoeAck(param1:uint, param2:Function)
      {
         this.position_ = new WorldPosData();
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeInt(this.time_);
         this.position_.writeToOutput(param1);
      }
      
      override public function toString() : String
      {
         return formatToString("AOEACK","time_","position_");
      }
   }
}
