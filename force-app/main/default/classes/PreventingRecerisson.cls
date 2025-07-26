public class PreventingRecerisson {
    // Static variable to prevent recursion
    public static Boolean firstCall = false; 

    public static void updation(List<Account> newList, Map<Id, Account> oldMap) {
        List<Account> accList = new List<Account>();

        for (Account acc : newList) {
            Account a = new Account(Id = acc.Id); // Creating a new instance to update
            a.Description = 'test';  // Updating the field
            accList.add(a);
        }

        if (!accList.isEmpty()) {
            update accList;  // Updating the records
        }
    }
}