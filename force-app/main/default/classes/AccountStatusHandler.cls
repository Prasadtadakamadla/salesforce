public class AccountStatusHandler {
    public static void updateAccountStatus(Set<Id> accountIds) {
        Map<Id, List<String>> accountCaseStatusMap = new Map<Id, List<String>>();
        
        // Fetch related Cases for given Account IDs
        for (Case c : [SELECT Id, Status, AccountId FROM Case WHERE AccountId IN :accountIds]) {
            if (!accountCaseStatusMap.containsKey(c.AccountId)) { // Fixes the condition
                accountCaseStatusMap.put(c.AccountId, new List<String>());
            }
            accountCaseStatusMap.get(c.AccountId).add(c.Status);
        }
 
        List<Account> accountsToUpdate = new List<Account>();
 
        for (Id accId : accountCaseStatusMap.keySet()) {
            List<String> statuses = accountCaseStatusMap.get(accId);
            String newStatus;
            
            if (statuses.contains('In Progress')) {
                newStatus = 'In Progress';
            } else if (statuses.contains('Open')) {
                newStatus = 'Open';
            } else {
                newStatus = 'Closed';
            }

            // Create Account record to update
            Account acc = new Account(
                Id = accId,
                case_status__c = newStatus
            );
            accountsToUpdate.add(acc);
        }

        // Perform DML update only if there are accounts to update
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}