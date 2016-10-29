package com.hurlant.math
{
   use namespace bi_internal;
   
   class ClassicReduction implements IReduction
   {
       
      
      private var m:com.hurlant.math.BigInteger;
      
      function ClassicReduction(param1:com.hurlant.math.BigInteger)
      {
         super();
         this.m = param1;
      }
      
      public function convert(param1:com.hurlant.math.BigInteger) : com.hurlant.math.BigInteger
      {
         if(param1.s < 0 || param1.compareTo(this.m) >= 0)
         {
            return param1.mod(this.m);
         }
         return param1;
      }
      
      public function revert(param1:com.hurlant.math.BigInteger) : com.hurlant.math.BigInteger
      {
         return param1;
      }
      
      public function reduce(param1:com.hurlant.math.BigInteger) : void
      {
         param1.divRemTo(this.m,null,param1);
      }
      
      public function mulTo(param1:com.hurlant.math.BigInteger, param2:com.hurlant.math.BigInteger, param3:com.hurlant.math.BigInteger) : void
      {
         param1.multiplyTo(param2,param3);
         this.reduce(param3);
      }
      
      public function sqrTo(param1:com.hurlant.math.BigInteger, param2:com.hurlant.math.BigInteger) : void
      {
         param1.squareTo(param2);
         this.reduce(param2);
      }
   }
}
