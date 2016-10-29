package kabam.rotmg.stage3D.graphic3D
{
   import org.swiftsuspenders.dependencyproviders.DependencyProvider;
   import kabam.rotmg.stage3D.proxies.IndexBuffer3DProxy;
   import org.swiftsuspenders.Injector;
   import flash.utils.Dictionary;
   import kabam.rotmg.stage3D.proxies.Context3DProxy;
   
   public class IndexBufferFactory implements DependencyProvider
   {
      
      private static const numVertices:int = 6;
       
      
      private var indexBuffer:IndexBuffer3DProxy;
      
      public function IndexBufferFactory(param1:Context3DProxy)
      {
         super();
         var _loc2_:Vector.<uint> = Vector.<uint>([0,1,2,2,1,3]);
         if(param1 != null)
         {
            this.indexBuffer = param1.createIndexBuffer(numVertices);
            this.indexBuffer.uploadFromVector(_loc2_,0,numVertices);
         }
      }
      
      public function apply(param1:Class, param2:Injector, param3:Dictionary) : Object
      {
         return this.indexBuffer;
      }
      
      public function destroy() : void
      {
      }
   }
}
