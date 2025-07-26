public with sharing class AccountControllers {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Industry, AnnualRevenue, Phone, Website FROM Account LIMIT 10];
    }
}