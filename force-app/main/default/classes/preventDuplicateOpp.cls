public class preventDuplicateOpp {
public static void preventing_duplicate_opp(list<account> oldaccounts)
{
   set<id> ids=new set<id>();
    for(account acc:oldaccounts){
        ids.add(acc.id);
    }  
    map<id,Integer> accList =new map<id,Integer>();
    for(aggregateResult ar:[select count(id) cout,accountid from opportunity where accountid IN:ids and IsClosed=false group by accountId])
    {
         accList.put((Id)ar.get('accountid'),(Integer)ar.get('cout'));
    }
    for(account acc:oldaccounts)
    if(accList.containskey(acc.id)){
        acc.addError('cannot delete the account');
    }
}
}