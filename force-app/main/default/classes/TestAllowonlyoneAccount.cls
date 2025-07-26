@isTest
private class TestAllowonlyoneAccount {
    
    @isTest
    static void testPhoneUpdate() {
        // Step 1: Create an Account with an initial phone number
        Account acc1 = new Account(Name = 'Test Account 1', Phone = '123-456-7890');
        Account acc2 = new Account(Name = 'Test Account 2', Phone = '555-666-7777');
        insert new List<Account>{acc1, acc2};

        // Step 2: Create related Contacts for these Accounts
        Contact con1 = new Contact(FirstName = 'John', LastName = 'Doe', AccountId = acc1.Id, Phone = '987-654-3210');
        Contact con2 = new Contact(FirstName = 'Jane', LastName = 'Smith', AccountId = acc1.Id, Phone = '555-555-5555');
        Contact con3 = new Contact(FirstName = 'Michael', LastName = 'Johnson', AccountId = acc2.Id, Phone = '888-999-0000');
        insert new List<Contact>{con1, con2, con3};

        // Step 3: Verify initial phone numbers for contacts
        System.assertEquals('987-654-3210', con1.Phone);
        System.assertEquals('555-555-5555', con2.Phone);
        System.assertEquals('888-999-0000', con3.Phone);
        
        // Step 4: Update Account phone numbers
        acc1.Phone = '111-222-3333';
        acc2.Phone = '777-888-9999';
        update new List<Account>{acc1, acc2};

        // Step 5: Query updated Contacts
        con1 = [SELECT Phone FROM Contact WHERE Id = :con1.Id];
        con2 = [SELECT Phone FROM Contact WHERE Id = :con2.Id];
        con3 = [SELECT Phone FROM Contact WHERE Id = :con3.Id];

        // Step 6: Assert that Contacts' phones match the updated Account's phones
        System.assertEquals('111-222-3333', con1.Phone, 'Contact phone should match updated Account phone');
        System.assertEquals('111-222-3333', con2.Phone, 'Contact phone should match updated Account phone');
        System.assertEquals('777-888-9999', con3.Phone, 'Contact phone should match updated Account phone');
    }
}