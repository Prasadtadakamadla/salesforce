public class TriggerTest {
    public static void Test(list<Account> acc,map<id,account> oldmap){
        map<id,account> opptobeupdated =new map<id,account>();
        list<Contact> aco=new list<contact>();
        for (Account ac:acc){
            if(oldmap!=null &&  ac.phone!=oldmap.get(ac.id).phone)
            {
                opptobeupdated.put(ac.id,ac);
            }
        }
        if (!opptobeupdated.isEmpty()) {
            for(contact opp:[select id,phone,accountid from contact where accountId in:opptobeupdated.keyset()]){
                contact con=new contact();
                con.id=opp.id;
                con.Phone=opptobeupdated.get(opp.AccountId).Phone;
                aco.add(con);
                
            }
        
        update aco;
        }
    }
}