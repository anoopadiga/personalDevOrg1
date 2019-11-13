trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
	//List of BatchLeadConvertErrors__c records to be inserted
    List<BatchLeadConvertErrors__c> insertListBLCE = new List<BatchLeadConvertErrors__c>();
    
    //Loop to process the batch apex error events
    for (BatchApexErrorEvent BAEE : trigger.New){
        BatchLeadConvertErrors__c BLCE = new BatchLeadConvertErrors__c();
        BLCE.AsyncApexJobId__c = BAEE.AsyncApexJobId;
        BLCE.Records__c = BAEE.JobScope;
        BLCE.StackTrace__c = BAEE.StackTrace;
        insertListBLCE.add(BLCE);
    }
    
    if(insertListBLCE.size() > 0){
        insert insertListBLCE;
    }
}