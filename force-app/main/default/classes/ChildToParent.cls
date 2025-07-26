public class ChildToParent {

    public static void contactChildInsertion(List<Contact> con) {
        if (RecerissionHandler.temp) return;
        RecerissionHandler.temp = true;

        Map<Id, String> accPhoneMap = new Map<Id, String>();
        for (Contact c : con) {
            if (c.AccountId != null && c.Phone != null) {
                accPhoneMap.put(c.AccountId, c.Phone);
            }
        }

        List<Account> accList = [SELECT Id, Phone FROM Account WHERE Id IN :accPhoneMap.keySet()];
        for (Account acc : accList) {
            acc.Phone = accPhoneMap.get(acc.Id);
        }

        if (!accList.isEmpty()) {
            update accList;
        }
    }

    public static void contactChildUpdation(List<Contact> con) {
        if (RecerissionHandler.temp) return;
        RecerissionHandler.temp = true;

        Map<Id, String> accPhoneMap = new Map<Id, String>();
        for (Contact c : con) {
            if (c.AccountId != null && c.Phone != null) {
                accPhoneMap.put(c.AccountId, c.Phone);
            }
        }

        List<Account> accList = [SELECT Id, Phone FROM Account WHERE Id IN :accPhoneMap.keySet()];
        for (Account acc : accList) {
            acc.Phone = accPhoneMap.get(acc.Id);
        }

        if (!accList.isEmpty()) {
            update accList;
        }
    }

    public static void contactChildDelete(List<Contact> con, Map<Id, Contact> oldMap) {
        if (RecerissionHandler.temp) return;
        RecerissionHandler.temp = true;

        Set<Id> accountIdsToDelete = new Set<Id>();

        for (Contact c : con) {
            Contact oldCon = oldMap != null ? oldMap.get(c.Id) : c;

            // Delete account if Description was cleared or contact is deleted with null description
            if (
                oldCon.Description != null &&
                String.isBlank(c.Description) &&
                oldCon.AccountId != null
            ) {
                accountIdsToDelete.add(oldCon.AccountId);
            }
        }

        if (!accountIdsToDelete.isEmpty()) {
            List<Account> accountsToDelete = [
                SELECT Id FROM Account WHERE Id IN :accountIdsToDelete
            ];

            if (!accountsToDelete.isEmpty()) {
                delete accountsToDelete;
            }
        }
    }
}