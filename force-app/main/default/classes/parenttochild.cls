public class parenttochild {
public static void AccounttoContact(list<Account> acc)
{
    map<id,String> ids=new map<id,String>();
    
   for(Account ac:acc){
        if(ac.description!=null)
        {
        ids.put(ac.id,ac.description);
        }
    }
    set<Contact> description = new set<Contact>();
    list<Contact> c=[select AccountId,Description from Contact where accountid=:ids.keyset()];
        for(Contact co:c){
            co.description=ids.get(co.AccountId);
        }
    if(c.isEmpty()!=null){
    update c;
    }
}
}