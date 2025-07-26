public with sharing class Accountadded {
    
    @AuraEnabled(cacheable=true)
    public static Integer getTotalAccountsCount(String searchKey) {
        String search = '%' + searchKey + '%';
        return [SELECT count() FROM Account WHERE Name LIKE :search];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String searchKey, Integer pageNumber, Integer pageSize) {
        Integer offset = (pageNumber - 1) * pageSize;
        String search = '%' + searchKey + '%';
        return [
            SELECT Id, Name, Phone
            FROM Account
            WHERE Name LIKE :search
            ORDER BY CreatedDate DESC
            LIMIT :pageSize OFFSET :offset
        ];
    }

    @AuraEnabled
    public static void addAccountToDatabase(List<Account> updatedAccounts) {
        update updatedAccounts;
    }

    @AuraEnabled
    public static void deleteAccount(Id accountId) {
        delete [SELECT Id FROM Account WHERE Id = :accountId];
    }
}