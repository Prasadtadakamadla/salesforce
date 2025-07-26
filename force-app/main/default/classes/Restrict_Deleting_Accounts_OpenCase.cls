public class Restrict_Deleting_Accounts_OpenCase {
    public static void  Restriction(list<account> acc){
        set<id> Accountids=new set<id>();
        for(account ac:acc){
           accountids.add(ac.id);
}
        set<id> caseids=new set<id>();
            for(case c:[select AccountId,Status from case where AccountId IN:Accountids and Status != 'Closed'])
        {
           
                caseids.add(c.accountid);                
        }
         for (Account ac : acc) {
            if (caseids.contains(ac.Id)) {
                ac.addError('You cannot delete this Account as it has open Cases.');
            }
        }
}
}