package com.company.assembleegameclient.screens.events
{
   import flash.events.Event;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   
   public class DeleteCharacterEvent extends Event
   {
      
      public static const DELETE_CHARACTER_EVENT:String = "DELETE_CHARACTER_EVENT";
       
      
      public var savedChar_:SavedCharacter;
      
      public function DeleteCharacterEvent(param1:SavedCharacter)
      {
         super(DELETE_CHARACTER_EVENT);
         this.savedChar_ = param1;
      }
   }
}
