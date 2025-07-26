public class UpdateDescription {
    public static void UpdateAccountDescription(List<Contact> contactList) {
        Map<Id, String> accountToNewDescription = new Map<Id, String>();

        for (Contact con : contactList) {
            if (con.AccountId != null) {
                // Latest description overwrites if multiple contacts point to same Account
                accountToNewDescription.put(con.AccountId, con.Description);
            }
        }

        List<Account> accToUpdate = [SELECT Id, Description FROM Account WHERE Id IN :accountToNewDescription.keySet()];

        for (Account acc : accToUpdate) {
            acc.Description = accountToNewDescription.get(acc.Id);
        }

        if (!accToUpdate.isEmpty()) {
            update accToUpdate;
        }
    }
}