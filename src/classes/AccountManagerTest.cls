@isTest
public class AccountManagerTest {
    
    // Helper method
    static Id createTestRecord() {
        
        // Create test record
        Account accTest = new Account(Name ='Test Account Record');
        insert AccTest;       

        Id accTestId = accTest.Id;        
        Contact concTest = new Contact(AccountId = accTestId);
        
        return accTestId;
    }
    
    @isTest static void testGetCaseById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = 'https://yourInstance.salesforce.com/services/apexrest/Accounts/'+ recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Account Record', thisAccount.Name);
    }
}