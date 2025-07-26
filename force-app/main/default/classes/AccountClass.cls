public with sharing class AccountClass {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String observable) {
        if (Schema.sObjectType.Account.isAccessible()) {
        if(observable == null || observable == '') {
        return [SELECT Id, Name, Industry FROM Account LIMIT 10];
        }
        else  {
            return [SELECT Id, Name, Industry FROM Account WHERE Name LIKE :observable LIMIT 100];
            }
        } else {
            throw new AuraHandledException('You do not have permission to access Account records.');
        }
    }

    
}