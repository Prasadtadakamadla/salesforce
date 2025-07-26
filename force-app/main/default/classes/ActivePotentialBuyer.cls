public class ActivePotentialBuyer {
    public static void ActiveBuyer(list<Account> acc){
        set<id> Accountids = new set<id>();
        for(Account ac:acc){
            Accountids.add(ac.id);
        }
        list<contact> con=[select Potential_Buyer__c from contact where accountid in:Accountids and Potential_Buyer__c =true];
        for(Account a:acc)
        {
            if(con.size()>=0)
            {
            a.addError('the contact has a potential contacts');
            }
        }
    }
}