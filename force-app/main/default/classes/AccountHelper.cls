public class AccountHelper {
     public static void restrictUpdateOnOldAccounts(List<Account> updatedAccounts){
         list<account> ListToUpdate=new list<account>();
         for(account acc:updatedAccounts){
             acc.ShippingStreet=acc.BillingStreet;
             acc.ShippingCity=acc.BillingCity;
             acc.ShippingState=acc.BillingState;
             acc.ShippingPostalCode=acc.BillingPostalCode;
             acc.ShippingCountry=acc.BillingCountry;
             ListToUpdate.add(acc);
         }
     }
     public static void createDefaultContact(List<Account> newAccounts)
     {
         List<Contact> contactsToInsert = new List<Contact>();
         contact con=new contact();
         for(account acc:newAccounts){
            con.LastName = acc.Name + ' Contact'; // Default LastName
            con.AccountId = acc.Id; // Linking to Account
            contactsToInsert.add(con);
         }
         insert contactsToInsert;
     }
     
     
}