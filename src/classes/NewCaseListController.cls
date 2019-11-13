public class NewCaseListController {
    private String caseFilter = 'New';
    
    public List<case> getNewCases(){
        List<Case> results = Database.query('SELECT Id, CaseNumber FROM Case WHERE Status = :caseFilter');       
        return results;
    }
}