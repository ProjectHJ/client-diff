package kabam.rotmg.account.kabam.model
{
   import kabam.rotmg.account.core.model.MoneyConfig;
   import kabam.rotmg.text.view.stringBuilder.StringBuilder;
   import com.company.assembleegameclient.util.offer.Offer;
   import kabam.rotmg.text.view.stringBuilder.LineBuilder;
   
   public class KabamMoneyConfig implements MoneyConfig
   {
       
      
      public function KabamMoneyConfig()
      {
         super();
      }
      
      public function showPaymentMethods() : Boolean
      {
         return true;
      }
      
      public function showBonuses() : Boolean
      {
         return false;
      }
      
      public function parseOfferPrice(param1:Offer) : StringBuilder
      {
         return new LineBuilder();
      }
      
      public function jsInitializeFunction() : String
      {
         return "rotmg.KabamPayment.setupKabamAccount";
      }
   }
}
