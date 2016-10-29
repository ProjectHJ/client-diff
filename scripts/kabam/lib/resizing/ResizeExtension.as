package kabam.lib.resizing
{
   import robotlegs.bender.framework.api.IExtension;
   import robotlegs.bender.framework.api.IContext;
   import robotlegs.bender.extensions.mediatorMap.MediatorMapExtension;
   
   public class ResizeExtension implements IExtension
   {
       
      
      public function ResizeExtension()
      {
         super();
      }
      
      public function extend(param1:IContext) : void
      {
         param1.extend(MediatorMapExtension);
         param1.configure(ResizeConfig);
      }
   }
}
