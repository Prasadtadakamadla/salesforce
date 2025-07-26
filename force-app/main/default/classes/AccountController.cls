public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        if (Schema.sObjectType.Account.isAccessible()) {
            return [SELECT Id, Name, Industry FROM Account LIMIT 10];
        } else {
            throw new AuraHandledException('You do not have permission to access Account records.');
        }
    }

    @AuraEnabled
    public static void getContactsByAccountId(List<Account> accList) {
        if (Schema.sObjectType.Contact.isAccessible()) {
           update accList;
        }
    }
}