public class AccountTriggerHandler {
    public static void handleAfterUpdate(List<Account> newAccounts, Map<Id, Account> oldAccounts) {
        List<Case> casesToUpdate = new List<Case>();
        for (Account acc : newAccounts) {
            Account oldAcc = oldAccounts.get(acc.Id);
            if (oldAcc.Value__c != acc.value__c && acc.Value__c == 'Expired') {
                List<Contact> relatedContacts = [
                    SELECT Id FROM Contact WHERE AccountId = :acc.Id
                ];
                if (!relatedContacts.isEmpty()) {
                    List<Case> relatedCases = [
                        SELECT Id, Status FROM Case WHERE ContactId IN :relatedContacts
                    ];

                    for (Case c : relatedCases) {
                        c.Status = 'Closed';
                        casesToUpdate.add(c);
                    }
                }
            }
        }
        if (!casesToUpdate.isEmpty()) {
            update casesToUpdate;
        } else {
            System.debug('No Cases Found to Update');
        }
    }
}