public class assignment5 {
    public static void updatingLast_Activity_Date(list<opportunity> opp){
        set<id> ids=new set<id>();
        for(opportunity op:opp){
            ids.add(op.AccountId);
        }
       list<Account> acc=[select id,name from account where id in:ids];
        for (account ac:acc){
            ac.Last_Activity_Date__C=date.today();
        }
       update acc;
    }
}