package kabam.rotmg.account.kongregate.model
{
   import kabam.rotmg.account.core.model.MoneyConfig;
   import kabam.rotmg.text.view.stringBuilder.StringBuilder;
   import com.company.assembleegameclient.util.offer.Offer;
   import kabam.rotmg.text.view.stringBuilder.LineBuilder;
   import kabam.rotmg.text.model.TextKey;
   
   public class KongregateMoneyConfig implements MoneyConfig
   {
       
      
      public function KongregateMoneyConfig()
      {
         super();
      }
      
      public function showPaymentMethods() : Boolean
      {
         return false;
      }
      
      public function showBonuses() : Boolean
      {
         return false;
      }
      
      public function parseOfferPrice(param1:Offer) : StringBuilder
      {
         return new LineBuilder().setParams(TextKey.PAYMENTS_KONGREGATE_COST,{"cost":param1.price_});
      }
      
      public function jsInitializeFunction() : String
      {
         throw new Error("No current support for new Kabam offer wall on Kongregate.");
      }
   }
}
