public class ParentAccounttoOpp {
    public static void OpportunityChild(list<Account> Acc){
       map<id,account> ids= new map<id,account>();
        for(account ac:acc){
          ids.put(ac.id,ac);
        }
    list<opportunity> c=[select id,accountid,description from opportunity  WHERE  accountid IN:ids.keyset()];
        for(opportunity con:c)
        {
            con.description=ids.get(con.accountid).description;
        }
        update c;
    }
}