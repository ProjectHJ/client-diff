package kabam.rotmg.messaging.impl
{
   import org.osflash.signals.Signal;
   import com.company.assembleegameclient.game.AGameSprite;
   import kabam.rotmg.servers.api.Server;
   import flash.utils.ByteArray;
   import kabam.lib.net.impl.SocketServer;
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.objects.Projectile;
   import com.company.assembleegameclient.objects.Player;
   
   public class GameServerConnection
   {
      
      public static const FAILURE:int = 0;
      
      public static const CREATE_SUCCESS:int = 47;
      
      public static const CREATE:int = 30;
      
      public static const PLAYERSHOOT:int = 88;
      
      public static const MOVE:int = 48;
      
      public static const PLAYERTEXT:int = 64;
      
      public static const TEXT:int = 27;
      
      public static const SERVERPLAYERSHOOT:int = 68;
      
      public static const DAMAGE:int = 9;
      
      public static const UPDATE:int = 1;
      
      public static const UPDATEACK:int = 60;
      
      public static const NOTIFICATION:int = 16;
      
      public static const NEWTICK:int = 23;
      
      public static const INVSWAP:int = 78;
      
      public static const USEITEM:int = 100;
      
      public static const SHOWEFFECT:int = 80;
      
      public static const HELLO:int = 36;
      
      public static const GOTO:int = 33;
      
      public static const INVDROP:int = 12;
      
      public static const INVRESULT:int = 18;
      
      public static const RECONNECT:int = 39;
      
      public static const PING:int = 79;
      
      public static const PONG:int = 34;
      
      public static const MAPINFO:int = 11;
      
      public static const LOAD:int = 49;
      
      public static const PIC:int = 57;
      
      public static const SETCONDITION:int = 93;
      
      public static const TELEPORT:int = 58;
      
      public static const USEPORTAL:int = 86;
      
      public static const DEATH:int = 26;
      
      public static const BUY:int = 90;
      
      public static const BUYRESULT:int = 10;
      
      public static const AOE:int = 94;
      
      public static const GROUNDDAMAGE:int = 46;
      
      public static const PLAYERHIT:int = 28;
      
      public static const ENEMYHIT:int = 21;
      
      public static const AOEACK:int = 92;
      
      public static const SHOOTACK:int = 40;
      
      public static const OTHERHIT:int = 50;
      
      public static const SQUAREHIT:int = 24;
      
      public static const GOTOACK:int = 4;
      
      public static const EDITACCOUNTLIST:int = 95;
      
      public static const ACCOUNTLIST:int = 99;
      
      public static const QUESTOBJID:int = 77;
      
      public static const CHOOSENAME:int = 8;
      
      public static const NAMERESULT:int = 22;
      
      public static const CREATEGUILD:int = 84;
      
      public static const GUILDRESULT:int = 66;
      
      public static const GUILDREMOVE:int = 7;
      
      public static const GUILDINVITE:int = 61;
      
      public static const ALLYSHOOT:int = 31;
      
      public static const ENEMYSHOOT:int = 81;
      
      public static const REQUESTTRADE:int = 82;
      
      public static const TRADEREQUESTED:int = 42;
      
      public static const TRADESTART:int = 45;
      
      public static const CHANGETRADE:int = 17;
      
      public static const TRADECHANGED:int = 87;
      
      public static const ACCEPTTRADE:int = 3;
      
      public static const CANCELTRADE:int = 76;
      
      public static const TRADEDONE:int = 55;
      
      public static const TRADEACCEPTED:int = 15;
      
      public static const CLIENTSTAT:int = 85;
      
      public static const CHECKCREDITS:int = 52;
      
      public static const ESCAPE:int = 98;
      
      public static const FILE:int = 5;
      
      public static const INVITEDTOGUILD:int = 69;
      
      public static const JOINGUILD:int = 25;
      
      public static const CHANGEGUILDRANK:int = 62;
      
      public static const PLAYSOUND:int = 65;
      
      public static const GLOBAL_NOTIFICATION:int = 41;
      
      public static const RESKIN:int = 74;
      
      public static const PETUPGRADEREQUEST:int = 19;
      
      public static const ACTIVE_PET_UPDATE_REQUEST:int = 75;
      
      public static const ACTIVEPETUPDATE:int = 63;
      
      public static const NEW_ABILITY:int = 38;
      
      public static const PETYARDUPDATE:int = 51;
      
      public static const EVOLVE_PET:int = 67;
      
      public static const DELETE_PET:int = 20;
      
      public static const HATCH_PET:int = 96;
      
      public static const ENTER_ARENA:int = 56;
      
      public static const IMMINENT_ARENA_WAVE:int = 35;
      
      public static const ARENA_DEATH:int = 89;
      
      public static const ACCEPT_ARENA_DEATH:int = 83;
      
      public static const VERIFY_EMAIL:int = 14;
      
      public static const RESKIN_UNLOCK:int = 37;
      
      public static const PASSWORD_PROMPT:int = 6;
      
      public static const QUEST_FETCH_ASK:int = 13;
      
      public static const QUEST_REDEEM:int = 101;
      
      public static const QUEST_FETCH_RESPONSE:int = 91;
      
      public static const QUEST_REDEEM_RESPONSE:int = 44;
      
      public static const PET_CHANGE_FORM_MSG:int = 53;
      
      public static const KEY_INFO_REQUEST:int = 59;
      
      public static const KEY_INFO_RESPONSE:int = 97;
      
      public static var instance:kabam.rotmg.messaging.impl.GameServerConnection;
       
      
      public var changeMapSignal:Signal;
      
      public var gs_:AGameSprite;
      
      public var server_:Server;
      
      public var gameId_:int;
      
      public var createCharacter_:Boolean;
      
      public var charId_:int;
      
      public var keyTime_:int;
      
      public var key_:ByteArray;
      
      public var mapJSON_:String;
      
      public var isFromArena_:Boolean = false;
      
      public var lastTickId_:int = -1;
      
      public var jitterWatcher_:kabam.rotmg.messaging.impl.JitterWatcher;
      
      public var serverConnection:SocketServer;
      
      public var outstandingBuy_:kabam.rotmg.messaging.impl.OutstandingBuy = null;
      
      public function GameServerConnection()
      {
         super();
      }
      
      public function chooseName(param1:String) : void
      {
      }
      
      public function createGuild(param1:String) : void
      {
      }
      
      public function connect() : void
      {
      }
      
      public function disconnect() : void
      {
      }
      
      public function checkCredits() : void
      {
      }
      
      public function escape() : void
      {
      }
      
      public function useItem(param1:int, param2:int, param3:int, param4:int, param5:Number, param6:Number, param7:int) : void
      {
      }
      
      public function useItem_new(param1:GameObject, param2:int) : Boolean
      {
         return false;
      }
      
      public function enableJitterWatcher() : void
      {
      }
      
      public function disableJitterWatcher() : void
      {
      }
      
      public function editAccountList(param1:int, param2:Boolean, param3:int) : void
      {
      }
      
      public function guildRemove(param1:String) : void
      {
      }
      
      public function guildInvite(param1:String) : void
      {
      }
      
      public function requestTrade(param1:String) : void
      {
      }
      
      public function changeTrade(param1:Vector.<Boolean>) : void
      {
      }
      
      public function acceptTrade(param1:Vector.<Boolean>, param2:Vector.<Boolean>) : void
      {
      }
      
      public function cancelTrade() : void
      {
      }
      
      public function joinGuild(param1:String) : void
      {
      }
      
      public function changeGuildRank(param1:String, param2:int) : void
      {
      }
      
      public function isConnected() : Boolean
      {
         return false;
      }
      
      public function teleport(param1:int) : void
      {
      }
      
      public function usePortal(param1:int) : void
      {
      }
      
      public function getNextDamage(param1:uint, param2:uint) : uint
      {
         return 0;
      }
      
      public function groundDamage(param1:int, param2:Number, param3:Number) : void
      {
      }
      
      public function playerShoot(param1:int, param2:Projectile) : void
      {
      }
      
      public function playerHit(param1:int, param2:int) : void
      {
      }
      
      public function enemyHit(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
      }
      
      public function otherHit(param1:int, param2:int, param3:int, param4:int) : void
      {
      }
      
      public function squareHit(param1:int, param2:int, param3:int) : void
      {
      }
      
      public function playerText(param1:String) : void
      {
      }
      
      public function invSwap(param1:Player, param2:GameObject, param3:int, param4:int, param5:GameObject, param6:int, param7:int) : Boolean
      {
         return false;
      }
      
      public function invSwapPotion(param1:Player, param2:GameObject, param3:int, param4:int, param5:GameObject, param6:int, param7:int) : Boolean
      {
         return false;
      }
      
      public function invDrop(param1:GameObject, param2:int, param3:int) : void
      {
      }
      
      public function setCondition(param1:uint, param2:Number) : void
      {
      }
      
      public function buy(param1:int, param2:int) : void
      {
      }
      
      public function questFetch() : void
      {
      }
      
      public function questRedeem(param1:int, param2:int, param3:int) : void
      {
      }
      
      public function keyInfoRequest(param1:int) : void
      {
      }
   }
}
