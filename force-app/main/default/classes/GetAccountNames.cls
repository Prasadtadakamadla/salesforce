public with sharing class GetAccountNames {
@AuraEnabled
    public static List<Account> fetchAccountNames() {
        if (Schema.sObjectType.Account.isAccessible()) {
            return [SELECT Id, Name FROM Account LIMIT 100];
        } else {
            throw new AuraHandledException('You do not have access to Account records.');
        }
    }
}