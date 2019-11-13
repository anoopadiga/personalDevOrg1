trigger DeleteRestrictInvoice on Invoice__c (before delete) {

//create a list of invoices with their line items in trigger.old map

List <Invoice__c> invoices = [Select i.name,(Select Name from Line_Items__r)
From Invoice__c i
Where i.Id IN :Trigger.oldMap.KeySet()];

//loop in through every every invoice in the list to mark the ones without Line items with Error

for(Invoice__c invoice : invoices){
if(!invoice.Line_Items__r.isEmpty()){
Trigger.oldMap.get(invoice.Id).addError('Cannot delete Invoices with Line Items');
}

}

}