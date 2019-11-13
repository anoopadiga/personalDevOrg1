@isTest
public without sharing class AccountProcessorTest{
    
	@isTest
    static void testCountContacts() {
        List<Account> accountsToInsert = new List<Account>();
        List<Contact> contactsToInsert = new List<Contact>();
        
        for(integer i=1; i<=200; i++){
            String accName = 'Test Account' + i;
            accountsToInsert.add(new Account(
                Name = accName
            ));
        }
        Database.insert(accountsToInsert, false);
        
        for(Account insAcc : accountsToInsert){
            for(integer j=1; j<=3; j++){
                String contactName = 'Test Contact' + j;
                contactsToInsert.add(new Contact(
                    LastName = contactName,
                    AccountId = insAcc.Id
                ));
            }
        }
        Database.insert(contactsToInsert, false);    
        system.debug('AA_AccountsInserted::' + accountsToInsert);
        system.debug('AA_ContactsInserted::' + contactsToInsert);
        System.Test.startTest();
            List<id> insertedAccountIdList = new List<id>();
            for(Account acc: accountsToInsert){
                insertedAccountIdList .add(acc.Id);
            }
            AccountProcessor.countContacts(insertedAccountIdList);
        System.Test.stopTest();
        
        List<Account> insertedAccountList = [Select Id, Number_of_Contacts__c From Account Where Name LIKE 'Test Account%'];
        for(Account accDetails : insertedAccountList){
            System.assertEquals(accDetails.Number_of_Contacts__c,3);
        }
    }
}