/* ***********************************************
 * 
 * Basic test class for the apex Controller for 
 * the AccountContactEdit app 
 * 
 * ***********************************************/
@isTest
private class BB_LTG_AccountContactEditCtrl_Test {
	@isTest
    static void TestController()
    {
        Account acc=new Account(Name='Unit Test');
        insert acc;
        
        Contact cont=new Contact(AccountId=acc.id,
                                 FirstName='Unit',
                                 LastName='Test');
        insert cont;
        
        Account accFromDB=BB_LTG_AccountContactEditCtrl.GetAccountAndContacts(acc.id);
        System.assertEquals(accFromDB.Id, acc.Id);

        accFromDB.contacts[0].LastName='Test2';
        BB_LTG_AccountContactEditCtrl.SaveAccountAndContacts(accFromDB, accFromDB.contacts);
    }
}