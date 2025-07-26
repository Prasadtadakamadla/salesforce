public class NoOfOpportunities {
    public static void CountOpp(list<Opportunity> opp){
        set<id> ids=new set<id>();
        for(opportunity op:opp) ids.add(op.id);
        map<id,String> couter=new  map<id,String>();
          for (AggregateResult ar:[select count(id) cout,accountid from opportunity where id in:ids GROUP BY accountId])
        couter.put((id)ar.get('accountid'),(string)ar.get('cout'));
        
    }
    
}