package kabam.rotmg.game.view
{
   import com.company.assembleegameclient.sound.SoundEffectLibrary;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.AssetLibrary;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.geom.Rectangle;
   import kabam.rotmg.core.StaticInjectorContext;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.rotmg.news.view.NewsModal;
   import kabam.rotmg.text.view.TextFieldDisplayConcrete;
   import kabam.rotmg.text.view.stringBuilder.StaticStringBuilder;
   import kabam.rotmg.ui.UIUtils;
   
   public class NewsModalButton extends Sprite
   {
      
      public static const IMAGE_NAME:String = "lofiObj2";
      
      public static const IMAGE_ID:int = 345;
      
      public static var showsHasUpdate:Boolean = false;
       
      
      private var bitmap:Bitmap;
      
      private var background:Sprite;
      
      private var background2:Sprite;
      
      private var icon:BitmapData;
      
      private var text:TextFieldDisplayConcrete;
      
      public function NewsModalButton()
      {
         super();
         mouseChildren = false;
         this.icon = TextureRedrawer.redraw(AssetLibrary.getImageFromSet(IMAGE_NAME,IMAGE_ID),40,true,0);
         this.bitmap = new Bitmap(this.icon);
         this.bitmap.x = -5;
         this.bitmap.y = -8;
         this.background = UIUtils.makeStaticHUDBackground();
         this.background2 = UIUtils.makeHUDBackground(31,UIUtils.NOTIFICATION_BACKGROUND_HEIGHT);
         this.text = new TextFieldDisplayConcrete().setSize(16).setColor(16777215);
         this.text.setStringBuilder(new StaticStringBuilder("Update!"));
         this.text.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         this.text.setVerticalAlign(TextFieldDisplayConcrete.BOTTOM);
         this.drawAsOpen();
         var _loc1_:Rectangle = this.bitmap.getBounds(this);
         var _loc2_:int = 10;
         this.text.x = _loc1_.right - _loc2_;
         this.text.y = _loc1_.bottom - _loc2_;
         addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function onClick(param1:MouseEvent) : void
      {
         var _loc2_:OpenDialogSignal = StaticInjectorContext.getInjector().getInstance(OpenDialogSignal);
         _loc2_.dispatch(new NewsModal());
         SoundEffectLibrary.play("button_click");
      }
      
      public function drawAsOpen() : void
      {
         if(NewsModal.hasUpdates())
         {
            showsHasUpdate = true;
            addChild(this.background);
            addChild(this.text);
         }
         else
         {
            showsHasUpdate = false;
            addChild(this.background2);
         }
         addChild(this.bitmap);
      }
   }
}
