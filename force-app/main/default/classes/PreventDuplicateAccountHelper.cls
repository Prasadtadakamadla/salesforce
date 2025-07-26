public class PreventDuplicateAccountHelper {
    public static void checkDuplicateAccounts(List<Account> newAccounts) {
        // Create a set to store unique Account Names from new records
        Set<String> newAccountNames = new Set<String>();

        for (Account acc : newAccounts) {
            if (acc.Name != null) {
                newAccountNames.add(acc.Name.toLowerCase()); // Case-insensitive comparison
            }
        }

        // Query existing Accounts with the same name
        Map<String, Account> existingAccounts = new Map<String, Account>();
        for (Account acc : [SELECT Id, Name FROM Account WHERE Name IN :newAccountNames]) {
            existingAccounts.put(acc.Name.toLowerCase(), acc);
        }

        // Prevent insertion if a duplicate exists
        for (Account acc : newAccounts) {
            if (acc.Name != null && existingAccounts.containsKey(acc.Name.toLowerCase())) {
                acc.addError('Duplicate Account Name found: ' + acc.Name);
            }
        }
    }
}