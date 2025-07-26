@isTest
public class PreventingAccountNameUpdationTest {
    
    @isTest
    static void testPreventingAccountNameUpdation() {
        // Create a test account
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        // Verify that the account is inserted successfully
        System.assertNotEquals(null, acc.Id, 'Account was not inserted successfully');

        // Try updating the account name (should fail)
        Test.startTest();
        acc.Name = 'Updated Account Name';
        try {
            update acc;
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('You cannot modify the account name once created'), 
                          'Expected validation error not found.');
        }
        Test.stopTest();

        // Verify that the name has not changed
        Account accAfterUpdate = [SELECT Name FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Test Account', accAfterUpdate.Name, 'Account name should not be updated.');
    }
}