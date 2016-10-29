package kabam.rotmg.tooltips
{
   import kabam.rotmg.core.signals.ShowTooltipSignal;
   import kabam.rotmg.core.signals.HideTooltipsSignal;
   
   public interface TooltipAble
   {
       
      
      function setShowToolTipSignal(param1:ShowTooltipSignal) : void;
      
      function getShowToolTip() : ShowTooltipSignal;
      
      function setHideToolTipsSignal(param1:HideTooltipsSignal) : void;
      
      function getHideToolTips() : HideTooltipsSignal;
   }
}
