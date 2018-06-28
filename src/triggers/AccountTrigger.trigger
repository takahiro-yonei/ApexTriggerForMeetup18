trigger AccountTrigger on Account (before insert, before update, after insert) {

  AccountTriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);

  //
  handler.addObserver(new TriggerOperation[]{TriggerOperation.BEFORE_INSERT, TriggerOperation.BEFORE_UPDATE}, new AccountTriggerHandler_Validation());
  handler.addObserver(new TriggerOperation[]{TriggerOperation.AFTER_INSERT}, new AccountTriggerHandler_FeedToXXX());


  switch on Trigger.operationType {
    when BEFORE_INSERT {
      handler.onBeforeInsert(Trigger.new);
    }
    when BEFORE_UPDATE {
      handler.onBeforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
    }
    when AFTER_INSERT {
      handler.onAfterInsert(Trigger.new);
    }
    when else {
      //
    }
  }

}
