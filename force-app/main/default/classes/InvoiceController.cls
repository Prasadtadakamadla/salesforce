// Apex Class: InvoiceController.cls
public with sharing class InvoiceController {
    @AuraEnabled(cacheable=true)
    public static List<Invoice__c> getInvoices() {
        return [SELECT Id, Name, Amount_c__c, Status_c__c FROM Invoice__c LIMIT 100];
    }
}