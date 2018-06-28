public without sharing class AccountTriggerHandler_Validation
    implements BaseTriggerHandler.ObserverTrgBeforeInsert, BaseTriggerHandler.ObserverTrgBeforeUpdate {

  public AccountTriggerHandler_Validation(){}

  /**
   * Action : Before Insert
   */
  public List<SObject> onBeforeInsert(List<SObject> newAccounts){
    for(Account acc : (List<Account>)newAccounts){
      // Some Validation Process...etc
      System.debug('onBeforeInsert: ' + acc);
    }
    return newAccounts;
  }

  /**
   * Action : Before Update
   */
  public List<SObject> onBeforeUpdate(List<SObject> oldAccounts,
                                      List<SObject> updAccounts,
                                      Map<Id, SObject> oldAccountMap,
                                      Map<Id, SObject> updAccountMap){
    for(Account acc : (List<Account>)updAccounts){
      // Some Validation Process...etc
      System.debug('onBeforeUpdate: ' + acc);
    }
    return updAccounts;
  }

}
