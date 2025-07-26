public class UpdateRelatedContacts {
    public static void updateRelatedRecords(List<Opportunity> op, Map<Id, Opportunity> oldMap) {
        Set<Id> oppIdSet = new Set<Id>();

        // Collect Opportunity IDs where stage is changed to 'Closed-Won'
        for (Opportunity opp : op) {
            if (opp.StageName == 'Closed-Won' && oldMap.get(opp.Id).StageName != 'Closed-Won') {
                oppIdSet.add(opp.Id);
            }
        }

        if (oppIdSet.isEmpty()) {
            return; // No records to process
        }

        // Query OpportunityContactRole to get related Contact IDs
        Set<Id> contactIds = new Set<Id>();
        for (OpportunityContactRole ocr : [SELECT ContactId FROM OpportunityContactRole WHERE OpportunityId IN :oppIdSet]) {
            contactIds.add(ocr.ContactId);
        }

        // Query Contacts and update LeadSource
        List<Contact> contactList = [ 
            SELECT Id, LeadSource 
            FROM Contact 
            WHERE Id IN :contactIds
        ];

        for (Contact c : contactList) {
            c.LeadSource = 'Customer';
        }

        // Perform bulk DML update
        if (!contactList.isEmpty()) {
            update contactList;  // Bulk update of all modified contacts
        }
    }
}