public with sharing class Demo {
    @AuraEnabled(cacheable=true)
    public static Account getSingleAccount(String accId) {
        return [SELECT Id, Name, Industry FROM Account WHERE Id = :accId LIMIT 1];
    }
}