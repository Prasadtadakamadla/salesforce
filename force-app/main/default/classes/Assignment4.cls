public class Assignment4 {
    public static void updateAccountCustomField(List<Contact> contactList) {
        Set<Id> accountIds = new Set<Id>();
        integer count=0;
        for (Contact con : contactList) {
            if (con.AccountId != null) {
                accountIds.add(con.AccountId);
                count++;
            }
        }
         

        if (!accountIds.isEmpty()) {
            List<Account> accountsToUpdate = [SELECT Id, Custom_Field__c FROM Account WHERE Id IN :accountIds];

            for (Account acc : accountsToUpdate) {
                acc.Custom_Field__c = String.valueOf(count);
            }

            // Perform bulk update
            if (!accountsToUpdate.isEmpty()) {
                update accountsToUpdate;
            }
        }
    }
}