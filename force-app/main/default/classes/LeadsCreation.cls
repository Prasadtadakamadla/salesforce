public with sharing class LeadsCreation {
    @AuraEnabled
    public static List<Lead> createLeads(String lastName, String company) {
        List<Lead> leads = new List<Lead>();
        if (Schema.sObjectType.Lead.isCreateable()) {
            try {
                Lead l = new Lead();
                l.LastName = lastName;
                l.Company = company;
                leads.add(l);
                insert leads;
            } catch (Exception e) {
                throw new AuraHandledException('Error creating lead: ' + e.getMessage());
            }
        } else {
            throw new AuraHandledException('You do not have permission to create leads.');
        }
        return leads;
    }
}