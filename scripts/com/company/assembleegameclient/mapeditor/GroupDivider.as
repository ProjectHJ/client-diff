package com.company.assembleegameclient.mapeditor
{
   import com.company.assembleegameclient.map.GroundLibrary;
   import com.company.assembleegameclient.map.RegionLibrary;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.util.MoreStringUtil;
   import flash.utils.Dictionary;
   import kabam.rotmg.core.StaticInjectorContext;
   import kabam.rotmg.core.model.PlayerModel;
   
   public class GroupDivider
   {
      
      public static const GROUP_LABELS:Vector.<String> = new <String>["Ground","Basic Objects","Enemies","Walls","3D Objects","All Objects","Regions","Dungeons"];
      
      public static var GROUPS:Dictionary = new Dictionary(true);
      
      public static var DEFAULT_DUNGEON:String = "AbyssOfDemons";
      
      public static var HIDE_OBJECTS_IDS:Vector.<String> = new <String>["Gothic Wiondow Light","Statue of Oryx Base","AbyssExitGuarder","AbyssIdolDead","AbyssTreasureLavaBomb","Area 1 Controller","Area 2 Controller","Area 3 Controller","Area 4 Controller","Area 5 Controller","Arena Horseman Anchor","FireMakerUp","FireMakerLf","FireMakerRt","FireMakerDn","Group Wall Observer","LavaTrigger","Mad Gas Controller","Mad Lab Open Wall","Maggot Sack","NM Black Open Wall","NM Blue Open Wall","NM Green Open Wall","NM Red Open Wall","NM Green Dragon Shield Counter","NM Green Dragon Shield Counter Deux","NM Red Dragon Lava Bomb","NM Red Dragon Lava Trigger","Pirate King Healer","Puppet Theatre Boss Spawn","Puppet Treasure Chest","Skuld Apparition","Sorc Bomb Thrower","Tempest Cloud","Treasure Dropper","Treasure Flame Trap 1.7 Sec","Treasure Flame Trap 1.2 Sec","Zombie Rise","destnex Observer 1","destnex Observer 2","destnex Observer 3","destnex Observer 4","drac floor black","drac floor blue","drac floor green","drac floor red","drac wall black","drac wall blue","drac wall red","drac wall green","ic boss manager","ic boss purifier generator","ic boss spawner live","md1 Governor","md1 Lava Makers","md1 Left Burst","md1 Right Burst","md1 Mid Burst","md1 Left Hand spawner","md1 Right Hand spawner","md1 RightHandSmash","md1 LeftHandSmash","shtrs Add Lava","shtrs Bird Check","shtrs BirdSpawn 1","shtrs BirdSpawn 2","shtrs Bridge Closer","shtrs Mage Closer 1","shtrs Monster Cluster","shtrs Mage Bridge Check","shtrs Bridge Review Board","shtrs Crystal Check","shtrs Final Fight Check","shtrs Final Mediator Lava","shtrs KillWall 1","shtrs KillWall 2","shtrs KillWall 3","shtrs KillWall 4","shtrs KillWall 5","shtrs KillWall 6","shtrs KillWall 7","shtrs Laser1","shtrs Laser2","shtrs Laser3","shtrs Laser4","shtrs Laser5","shtrs Laser6","shtrs Pause Watcher","shtrs Player Check","shtrs Player Check Archmage","shtrs Spawn Bridge","shtrs The Cursed Crown","shtrs blobomb maker","shtrs portal maker","vlntns Governor","vlntns Planter"];
       
      
      public function GroupDivider()
      {
         super();
      }
      
      public static function divideObjects() : void
      {
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:Boolean = false;
         var _loc12_:XML = null;
         var _loc13_:XML = null;
         var _loc14_:PlayerModel = null;
         var _loc15_:String = null;
         var _loc16_:XML = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:Dictionary = new Dictionary(true);
         var _loc3_:Dictionary = new Dictionary(true);
         var _loc4_:Dictionary = new Dictionary(true);
         var _loc5_:Dictionary = new Dictionary(true);
         var _loc6_:Dictionary = new Dictionary(true);
         var _loc7_:Dictionary = new Dictionary(true);
         var _loc8_:Dictionary = new Dictionary(true);
         for each(_loc12_ in ObjectLibrary.xmlLibrary_)
         {
            _loc10_ = _loc12_.@id;
            _loc9_ = int(_loc12_.@type);
            _loc14_ = StaticInjectorContext.getInjector().getInstance(PlayerModel);
            if(!(_loc12_.hasOwnProperty("Item") || _loc12_.hasOwnProperty("Player") || _loc12_.Class == "Projectile" || _loc12_.Class == "PetSkin" || _loc12_.Class == "Pet" || _loc10_.search("Spawner") >= 0 && !_loc14_.isAdmin()))
            {
               if(!(!_loc14_.isAdmin() && HIDE_OBJECTS_IDS.indexOf(_loc10_) >= 0))
               {
                  _loc11_ = false;
                  if(_loc12_.hasOwnProperty("Class") && String(_loc12_.Class).match(/wall$/i))
                  {
                     _loc6_[_loc9_] = _loc12_;
                     _loc7_[_loc9_] = _loc12_;
                     _loc11_ = true;
                  }
                  else if(_loc12_.hasOwnProperty("Model"))
                  {
                     _loc5_[_loc9_] = _loc12_;
                     _loc7_[_loc9_] = _loc12_;
                     _loc11_ = true;
                  }
                  else if(_loc12_.hasOwnProperty("Enemy"))
                  {
                     _loc4_[_loc9_] = _loc12_;
                     _loc7_[_loc9_] = _loc12_;
                     _loc11_ = true;
                  }
                  else if(_loc12_.hasOwnProperty("Static") && !_loc12_.hasOwnProperty("Price"))
                  {
                     _loc3_[_loc9_] = _loc12_;
                     _loc7_[_loc9_] = _loc12_;
                     _loc11_ = true;
                  }
                  else if(_loc14_.isAdmin())
                  {
                     _loc7_[_loc9_] = _loc12_;
                  }
                  _loc15_ = ObjectLibrary.propsLibrary_[_loc9_].belonedDungeon;
                  if(_loc11_ && _loc15_ != "")
                  {
                     if(_loc8_[_loc15_] == null)
                     {
                        _loc8_[_loc15_] = new Dictionary(true);
                     }
                     _loc8_[_loc15_][_loc9_] = _loc12_;
                  }
               }
            }
         }
         for each(_loc13_ in GroundLibrary.xmlLibrary_)
         {
            _loc1_[int(_loc13_.@type)] = _loc13_;
         }
         if(_loc14_.isAdmin())
         {
            for each(_loc16_ in RegionLibrary.xmlLibrary_)
            {
               _loc2_[int(_loc16_.@type)] = _loc16_;
            }
         }
         else
         {
            _loc2_[RegionLibrary.idToType_["Spawn"]] = RegionLibrary.xmlLibrary_[RegionLibrary.idToType_["Spawn"]];
            _loc2_[RegionLibrary.idToType_["User Dungeon End"]] = RegionLibrary.xmlLibrary_[RegionLibrary.idToType_["User Dungeon End"]];
         }
         GROUPS[GROUP_LABELS[0]] = _loc1_;
         GROUPS[GROUP_LABELS[1]] = _loc3_;
         GROUPS[GROUP_LABELS[2]] = _loc4_;
         GROUPS[GROUP_LABELS[3]] = _loc6_;
         GROUPS[GROUP_LABELS[4]] = _loc5_;
         GROUPS[GROUP_LABELS[5]] = _loc7_;
         GROUPS[GROUP_LABELS[6]] = _loc2_;
         GROUPS[GROUP_LABELS[7]] = _loc8_;
      }
      
      public static function getDungeonsLabel() : Vector.<String>
      {
         var _loc2_:* = null;
         var _loc1_:Vector.<String> = new Vector.<String>();
         for(_loc2_ in ObjectLibrary.dungeonsXMLLibrary_)
         {
            _loc1_.push(_loc2_);
         }
         _loc1_.sort(MoreStringUtil.cmp);
         return _loc1_;
      }
      
      public static function getDungeonsXML(param1:String) : Dictionary
      {
         return GROUPS[GROUP_LABELS[7]][param1];
      }
      
      public static function getCategoryByType(param1:int, param2:int) : String
      {
         var _loc4_:XML = null;
         var _loc3_:PlayerModel = StaticInjectorContext.getInjector().getInstance(PlayerModel);
         if(param2 == Layer.REGION)
         {
            return GROUP_LABELS[6];
         }
         if(param2 == Layer.GROUND)
         {
            return GROUP_LABELS[0];
         }
         if(_loc3_.isAdmin())
         {
            return GROUP_LABELS[5];
         }
         _loc4_ = ObjectLibrary.xmlLibrary_[param1];
         if(_loc4_.hasOwnProperty("Item") || _loc4_.hasOwnProperty("Player") || _loc4_.Class == "Projectile" || _loc4_.Class == "PetSkin" || _loc4_.Class == "Pet")
         {
            return "";
         }
         if(_loc4_.hasOwnProperty("Enemy"))
         {
            return GROUP_LABELS[2];
         }
         if(_loc4_.hasOwnProperty("Model"))
         {
            return GROUP_LABELS[4];
         }
         if(_loc4_.hasOwnProperty("Class") && String(_loc4_.Class).match(/wall$/i))
         {
            return GROUP_LABELS[3];
         }
         if(_loc4_.hasOwnProperty("Static") && !_loc4_.hasOwnProperty("Price"))
         {
            return GROUP_LABELS[1];
         }
         return "";
      }
   }
}
