package kabam.display.Loader
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   import kabam.display.LoaderInfo.LoaderInfoProxy;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class LoaderProxy extends Sprite
   {
       
      
      public function LoaderProxy()
      {
         super();
      }
      
      public function get content() : DisplayObject
      {
         return null;
      }
      
      public function get contentLoaderInfo() : LoaderInfoProxy
      {
         return null;
      }
      
      public function load(param1:URLRequest, param2:LoaderContext = null) : void
      {
      }
      
      public function unload() : void
      {
      }
   }
}
