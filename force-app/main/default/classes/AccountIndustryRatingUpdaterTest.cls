@isTest
public class AccountIndustryRatingUpdaterTest {
    
    @isTest
    static void testUpdateAccountRating() {
        // Create test accounts with different industries
        Account acc1 = new Account(Name = 'Tech Account', Industry = 'Technology');
        Account acc2 = new Account(Name = 'Non-Profit Account', Industry = 'Not For Profit');
        Account acc3 = new Account(Name = 'Other Account', Industry = 'Finance'); // Industry not handled explicitly

        // Insert test accounts into the database
        insert new List<Account>{ acc1, acc2, acc3 };

        // Query inserted accounts
        List<Account> testAccounts = [SELECT Id, Name, Industry, Rating FROM Account WHERE Id IN :new List<Id>{acc1.Id, acc2.Id, acc3.Id}];

        // Call the method under test
        AccountIndustryRatingUpdater.updateAccountRating(testAccounts);

        // Query the accounts again to verify the changes
        List<Account> updatedAccounts = [SELECT Id, Industry, Rating FROM Account WHERE Id IN :new List<Id>{acc1.Id, acc2.Id, acc3.Id}];

        // Perform assertions
        System.assertEquals('Warm', updatedAccounts[0].Rating, 'Technology industry should have Warm rating');
        System.assertEquals('Cool', updatedAccounts[1].Rating, 'Not For Profit industry should have Cool rating');
        System.assertEquals('Hot', updatedAccounts[2].Rating, 'Other industries should have Hot rating');
    }
}