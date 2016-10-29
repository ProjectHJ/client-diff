package kabam.rotmg.minimap.view
{
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import org.osflash.signals.Signal;
   import flash.display.Bitmap;
   import com.company.util.AssetLibrary;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   
   public class MiniMapZoomButtons extends Sprite
   {
       
      
      private const FADE:ColorTransform = new ColorTransform(0.5,0.5,0.5);
      
      private const NORM:ColorTransform = new ColorTransform(1,1,1);
      
      public const zoom:Signal = new Signal(int);
      
      private var zoomOut:Sprite;
      
      private var zoomIn:Sprite;
      
      private var zoomLevels:int;
      
      private var zoomLevel:int;
      
      public function MiniMapZoomButtons()
      {
         super();
         this.zoomLevel = 0;
         this.makeZoomOut();
         this.makeZoomIn();
         this.updateButtons();
      }
      
      public function getZoomLevel() : int
      {
         return this.zoomLevel;
      }
      
      public function setZoomLevel(param1:int) : int
      {
         if(this.zoomLevels == 0)
         {
            return this.zoomLevel;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 >= this.zoomLevels - 1)
         {
            param1 = this.zoomLevels - 1;
         }
         this.zoomLevel = param1;
         this.updateButtons();
         return this.zoomLevel;
      }
      
      public function setZoomLevels(param1:int) : int
      {
         this.zoomLevels = param1;
         if(this.zoomLevel >= this.zoomLevels)
         {
            this.zoomLevel = this.zoomLevels - 1;
         }
         this.updateButtons();
         return this.zoomLevels;
      }
      
      private function makeZoomOut() : void
      {
         var _loc2_:Bitmap = null;
         var _loc1_:BitmapData = AssetLibrary.getImageFromSet("lofiInterface",54);
         _loc2_ = new Bitmap(_loc1_);
         _loc2_.scaleX = 2;
         _loc2_.scaleY = 2;
         this.zoomOut = new Sprite();
         this.zoomOut.x = 0;
         this.zoomOut.y = 4;
         this.zoomOut.addChild(_loc2_);
         this.zoomOut.addEventListener(MouseEvent.CLICK,this.onZoomOut);
         addChild(this.zoomOut);
      }
      
      private function makeZoomIn() : void
      {
         var _loc2_:Bitmap = null;
         var _loc1_:BitmapData = AssetLibrary.getImageFromSet("lofiInterface",55);
         _loc2_ = new Bitmap(_loc1_);
         _loc2_.scaleX = 2;
         _loc2_.scaleY = 2;
         this.zoomIn = new Sprite();
         this.zoomIn.x = 0;
         this.zoomIn.y = 14;
         this.zoomIn.addChild(_loc2_);
         this.zoomIn.addEventListener(MouseEvent.CLICK,this.onZoomIn);
         addChild(this.zoomIn);
      }
      
      private function onZoomOut(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         if(this.canZoomOut())
         {
            this.zoom.dispatch(--this.zoomLevel);
            this.zoomOut.transform.colorTransform = !!this.canZoomOut()?this.NORM:this.FADE;
         }
      }
      
      private function canZoomOut() : Boolean
      {
         return this.zoomLevel > 0;
      }
      
      private function onZoomIn(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         if(this.canZoomIn())
         {
            this.zoom.dispatch(++this.zoomLevel);
            this.zoomIn.transform.colorTransform = !!this.canZoomIn()?this.NORM:this.FADE;
         }
      }
      
      private function canZoomIn() : Boolean
      {
         return this.zoomLevel < this.zoomLevels - 1;
      }
      
      private function updateButtons() : void
      {
         this.zoomIn.transform.colorTransform = !!this.canZoomIn()?this.NORM:this.FADE;
         this.zoomOut.transform.colorTransform = !!this.canZoomOut()?this.NORM:this.FADE;
      }
   }
}