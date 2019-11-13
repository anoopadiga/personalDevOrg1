public without sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> listAccountIds) {
        
        Set<Id> accountIdSet = new set<id>();
        accountIdSet.addAll(listAccountIds);
        
        List<Contact> contactList = [   SELECT Id, AccountId
                                        FROM Contact
                                        WHERE Account.Id =: accountIdSet];
        
        Map<Id, Integer> accToContactMap = new Map<Id, Integer>();
        for(Contact con : contactList){
            if(!accToContactMap.isEmpty() && accToContactMap.get(con.AccountId) != null){
                Integer count = accToContactMap.get(con.AccountId);
                accToContactMap.put(con.AccountId, count + 1);
            }else{
                accToContactMap.put(con.AccountId, 1);
            }
        }
        
        List<Account> updateAccountList = new List<Account>();
        for(Id accId : accToContactMap.keySet()){
            Account acc = new Account();
            acc.Id = accId;
            acc.Number_of_Contacts__c = accToContactMap.get(accId);
            updateAccountList.add(acc);
        }

        if(!updateAccountList.isEmpty()){
            Update updateAccountList;
        }
    }
}