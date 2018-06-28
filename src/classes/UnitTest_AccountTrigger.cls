@isTest
private class UnitTest_AccountTrigger {

  @isTest static void test_createAccount(){

    Test.startTest();

    Account testAcc = new Account(Name = 'TestXXXX');
    insert testAcc;

    Test.stopTest();

  }

  @isTest static void test_updateAccount(){
    Account testAcc = new Account(Name = 'TestXXXX');
    insert testAcc;


    Test.startTest();

    testAcc.AccountNumber = '123456';
    update testAcc;

    Test.stopTest();

  }

}
