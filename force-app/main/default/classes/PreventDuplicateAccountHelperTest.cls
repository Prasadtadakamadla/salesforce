@isTest
public class PreventDuplicateAccountHelperTest {
    
    @testSetup
    static void setupTestData() {
        // Create a test account to check duplicate prevention
        Account acc = new Account(Name = 'Test Account');
        insert acc;
    }

    @isTest
    static void testDuplicateAccountInsertion() {
        // Try inserting an account with the same name as the existing one
        Account duplicateAcc = new Account(Name = 'Test Account');

        Test.startTest();
        try {
            insert duplicateAcc; // This should throw an exception
            System.assert(false, 'Expected an exception but none was thrown.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Duplicate Account Name found'),
                          'Error message should indicate duplicate Account Name.');
        }
        Test.stopTest();
    }

    @isTest
    static void testUniqueAccountInsertion() {
        // Insert a unique account (should succeed)
        Account uniqueAcc = new Account(Name = 'Unique Account');

        Test.startTest();
        insert uniqueAcc;
        Test.stopTest();

        // Query the newly inserted account
        Account insertedAcc = [SELECT Id, Name FROM Account WHERE Name = 'Unique Account' LIMIT 1];
        System.assertNotEquals(null, insertedAcc, 'The unique account should be inserted successfully.');
    }
}