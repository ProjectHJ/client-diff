package kabam.rotmg.account.core.model
{
   import kabam.rotmg.text.view.stringBuilder.StringBuilder;
   import com.company.assembleegameclient.util.offer.Offer;
   
   public interface MoneyConfig
   {
       
      
      function showPaymentMethods() : Boolean;
      
      function showBonuses() : Boolean;
      
      function parseOfferPrice(param1:Offer) : StringBuilder;
      
      function jsInitializeFunction() : String;
   }
}
