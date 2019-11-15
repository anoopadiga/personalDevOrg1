//Adding 1 Comment line to verify validate.
//Adding 2 Comment line to verify validate.
//Adding 3 Comment line to verify validate .
public with sharing class AccountController {
  public static List<Account> getAllActiveAccounts() {
    return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
  }
}
