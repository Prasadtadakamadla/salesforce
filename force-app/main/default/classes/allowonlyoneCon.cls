public class allowonlyoneCon {
public static void ContactTrigger(list<account> acc,map<id,account> oldmap)
{
List<Contact> contactsToUpdate = new List<Contact>();
      for(account ac:acc){
        if(ac.phone!=null && ac.phone!=oldmap.get(ac.id).phone){
            list<contact> co=[select id,phone from contact where accountid=:ac.id];
            for(contact con: co)
            {
             con.phone=ac.Phone;   
                update con;
            }
            
        }

}
}
}