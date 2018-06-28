public virtual class BaseTriggerHandler {

  //------------------------------------------------------------------------------------------------
  // トリガイベントに応じたインターフェースの定義
  //------------------------------------------------------------------------------------------------
  public virtual interface ObserverTrg {}

  public interface ObserverTrgBeforeInsert extends ObserverTrg {
    List<SObject> onBeforeInsert(List<SObject> newObjects);
  }
  public interface ObserverTrgBeforeUpdate extends ObserverTrg {
    List<SObject> onBeforeUpdate(List<SObject> oldObjects, List<SObject> newObjects, Map<Id, SObject> oldObjectMap, Map<Id, SObject> newObjectMap);
  }
  public interface ObserverTrgBeforeDelete extends ObserverTrg {
    List<SObject> onBeforeDelete(List<SObject> delObjects);
  }

  public interface ObserverTrgAfterInsert extends ObserverTrg {
    void onAfterInsert(List<SObject> newObjects);
  }
  public interface ObserverTrgAfterUpdate extends ObserverTrg {
    void onAfterUpdate(List<SObject> oldObjects, List<SObject> newObjects, Map<Id, SObject> oldObjectMap, Map<Id, SObject> newObjectMap);
  }
  public interface ObserverTrgAfterDelete extends ObserverTrg {
    void onAfterDelete(List<SObject> delObjects);
  }

  protected Boolean IsExecuting = false;
  protected Integer BatchSize = 0;

  protected List<ObserverTrgBeforeInsert> beforeInsertObservers;
  protected List<ObserverTrgBeforeUpdate> beforeUpdateObservers;
  protected List<ObserverTrgBeforeDelete> beforeDeleteObservers;
  protected List<ObserverTrgAfterInsert> afterInsertObservers;
  protected List<ObserverTrgAfterUpdate> afterUpdateObservers;
  protected List<ObserverTrgAfterDelete> afterDeleteObservers;


  public BaseTriggerHandler(boolean param_IsExecuting, Integer param_Size){
    this.IsExecuting = param_IsExecuting;
    this.BatchSize = param_Size;

    beforeInsertObservers = new List<ObserverTrgBeforeInsert>();
    beforeUpdateObservers = new List<ObserverTrgBeforeUpdate>();
    beforeDeleteObservers = new List<ObserverTrgBeforeDelete>();
    afterInsertObservers = new List<ObserverTrgAfterInsert>();
    afterUpdateObservers = new List<ObserverTrgAfterUpdate>();
    afterDeleteObservers = new List<ObserverTrgAfterDelete>();
  }


  //------------------------------------------------------------------------------------------------
  // 各種オブザーバーの追加メソッド
  //------------------------------------------------------------------------------------------------
  public void addObserver(List<System.TriggerOperation> points, ObserverTrg ob){

    for(System.TriggerOperation o : points){
      switch on o {
        when BEFORE_INSERT {
          beforeInsertObservers.add((ObserverTrgBeforeInsert)ob);
        }
        when BEFORE_UPDATE {
          beforeUpdateObservers.add((ObserverTrgBeforeUpdate)ob);
        }
        when BEFORE_DELETE {
          beforeDeleteObservers.add((ObserverTrgBeforeDelete)ob);
        }
        when AFTER_INSERT {
          afterInsertObservers.add((ObserverTrgAfterInsert)ob);
        }
        when AFTER_UPDATE {
          afterUpdateObservers.add((ObserverTrgAfterUpdate)ob);
        }
        when AFTER_DELETE {
          afterDeleteObservers.add((ObserverTrgAfterDelete)ob);
        }
        when AFTER_UNDELETE {
          //
        }
        when else {

        }
      }
    }

  }

}
