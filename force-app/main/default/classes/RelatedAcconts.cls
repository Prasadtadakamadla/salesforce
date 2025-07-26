public with sharing class RelatedAcconts {

    @AuraEnabled
    public static Account getRelatedAccount(Id contactId) {
        Contact con = [SELECT AccountId FROM Contact WHERE Id = :contactId LIMIT 1];
        return [SELECT Id, Name, Rating FROM Account WHERE Id = :con.AccountId LIMIT 1];
    }

    @AuraEnabled
    public static List<Contact> getRelatedContacts(Id contactId) {
        Contact con = [SELECT AccountId FROM Contact WHERE Id = :contactId LIMIT 1];
        return [
            SELECT Id, Name, Phone, Gender__c
            FROM Contact
            WHERE AccountId = :con.AccountId
        ];
    }

    @AuraEnabled
    public static List<Case> getRelatedCases(Id contactId) {
        Contact con = [SELECT AccountId FROM Contact WHERE Id = :contactId LIMIT 1];
        return [
            SELECT Id, Subject, Status, CaseNumber
            FROM Case
            WHERE AccountId = :con.AccountId AND Status != 'Closed'
        ];
    }
}