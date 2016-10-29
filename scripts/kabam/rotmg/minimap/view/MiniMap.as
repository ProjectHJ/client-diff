package kabam.rotmg.minimap.view
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.map.AbstractMap;
   import flash.display.DisplayObjectContainer;
   import com.company.assembleegameclient.objects.GameObject;
   
   public class MiniMap extends Sprite
   {
       
      
      public var map:AbstractMap;
      
      public var menuLayer:DisplayObjectContainer;
      
      public function MiniMap()
      {
         super();
      }
      
      public function setMap(param1:AbstractMap) : void
      {
      }
      
      public function deactivate() : void
      {
      }
      
      public function setFocus(param1:GameObject) : void
      {
      }
      
      public function setGroundTile(param1:int, param2:int, param3:uint) : void
      {
      }
      
      public function setGameObjectTile(param1:int, param2:int, param3:GameObject) : void
      {
      }
      
      public function zoomIn() : void
      {
      }
      
      public function zoomOut() : void
      {
      }
      
      public function draw() : void
      {
      }
   }
}
