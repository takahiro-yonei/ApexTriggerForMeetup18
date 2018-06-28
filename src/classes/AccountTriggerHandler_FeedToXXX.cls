public without sharing class AccountTriggerHandler_FeedToXXX
    implements BaseTriggerHandler.ObserverTrgAfterInsert {

  public AccountTriggerHandler_FeedToXXX() {}

  /**
   * Action : After Insert
   */
  public void onAfterInsert(List<SObject> newAccounts){
    for(Account acc : (List<Account>)newAccounts){
      // Some Process
      System.debug('onAfterInsert: ' + acc);
    }
  }

}
