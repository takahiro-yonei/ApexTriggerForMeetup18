public without sharing class AccountTriggerHandler extends BaseTriggerHandler {
  private static Boolean InProcess = false;

  public AccountTriggerHandler(boolean pIsExecuting, Integer pSize){
    super(pIsExecuting, pSize);
  }

  /**
   * Event Action: Before Insert
   */
  public void onBeforeInsert(Account[] newAccounts){
    for(BaseTriggerHandler.ObserverTrgBeforeInsert observer : beforeInsertObservers){
      newAccounts = (List<Account>)observer.onBeforeInsert(newAccounts);
    }
  }

  /**
   * Event Action: After Insert
   */
  public void onAfterInsert(Account[] newAccounts){
    for(BaseTriggerHandler.ObserverTrgAfterInsert observer : afterInsertObservers){
      observer.onAfterInsert(newAccounts);
    }
  }

  /**
   * Event Action : Before Update
   */
  public void onBeforeUpdate(Account[] oldAccounts, Account[] updAccounts, Map<Id, Account> oldAccountMap, Map<Id, Account> updAccountMap){
    if(InProcess){ return; }
    for(BaseTriggerHandler.ObserverTrgBeforeUpdate observer : beforeUpdateObservers){
      updAccounts = (List<Account>)observer.onBeforeUpdate(oldAccounts, updAccounts, oldAccountMap, updAccountMap);
    }
  }

  /**
   * Event Action: After Update
   */
  public void onAfterUpdate(Account[] oldAccounts, Account[] updAccounts, Map<Id, Account> oldAccountMap, Map<Id, Account> updAccountMap){
    if(InProcess){ return; }

    InProcess = true;

    for(BaseTriggerHandler.ObserverTrgAfterUpdate observer : afterUpdateObservers){
      observer.onAfterUpdate(oldAccounts, updAccounts, oldAccountMap, updAccountMap);
    }

    InProcess = false;
  }

  /**
   * Event Action: After Delete
   */
  public void onAfterDelete(Account[] delAccounts){
    for(BaseTriggerHandler.ObserverTrgAfterDelete observer : afterDeleteObservers){
      observer.onAfterDelete(delAccounts);
    }
  }

}
