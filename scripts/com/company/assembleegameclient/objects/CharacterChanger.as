package com.company.assembleegameclient.objects
{
   import com.company.assembleegameclient.ui.panels.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.ui.panels.CharacterChangerPanel;
   
   public class CharacterChanger extends GameObject implements IInteractiveObject
   {
       
      
      public function CharacterChanger(param1:XML)
      {
         super(param1);
         isInteractive_ = true;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new CharacterChangerPanel(param1);
      }
   }
}
