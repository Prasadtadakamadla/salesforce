@isTest
private class LeadScoreUpdateBatchTest {
    @isTest static void testBatch() {
        // Test data setup
        Account acc1 = new Account(Name='Test1', Industry='Technology', AnnualRevenue=1000000);
        insert acc1;

        Test.startTest();
        LeadScoreUpdateBatch batch = new LeadScoreUpdateBatch('Technology', 500000, 'Hot');
        Database.executeBatch(batch, 50);
        Test.stopTest();

        // Verify
        Account updatedAcc = [SELECT LeadScore__c FROM Account WHERE Id = :acc1.Id];
        System.assertEquals('Hot', updatedAcc.LeadScore__c);
    }
}