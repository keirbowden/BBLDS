/* ***********************************************
 * 
 * Apex Controller for the AccountContactEdit
 * app
 * 
 * ***********************************************/
public class BB_LTG_AccountContactEditCtrl {
	@AuraEnabled
    public static Account GetAccountAndContacts(String accountIdStr)
    {
        System.debug('Account id = ' + accountIdStr);
        Id accountId=(Id) accountIdStr;
        Account acc=[select Id, Name,
                     (select Id, FirstName, LastName, Email from Contacts)
                     from Account where id=:accountId];

		return acc;
    }
    
    @AuraEnabled
    public static void SaveAccountAndContacts(Account acc, List<Contact> contacts) {
        update acc;
        update contacts;
    }
}