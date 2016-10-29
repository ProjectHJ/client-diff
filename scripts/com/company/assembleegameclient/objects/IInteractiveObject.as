package com.company.assembleegameclient.objects
{
   import com.company.assembleegameclient.ui.panels.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   
   public interface IInteractiveObject
   {
       
      
      function getPanel(param1:GameSprite) : Panel;
   }
}
