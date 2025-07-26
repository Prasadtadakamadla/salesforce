public class AccountObject_trigger {
    public static void beforeInsertion(list<Account> acc){
        for(Account ac:acc){
            ac.AccountNumber='7282819911';
        }
        
    }
    public static void afterInsertion(list<Account> acc){
        list<contact> contacts=new list<contact>();
        for(Account ac:acc){
            if(ac.name!=null)
            {
               contact c=new contact();
               c.AccountId=ac.id; 
               c.LastName = 'Default';
               contacts.add(c);
            }
            insert contacts;
        }
    }
    public static void beforeUpdate(list<account> acc,map<id,account> mcc)
    {
        for(account ac:acc)
        {
           if(ac.Phone!=null && ac.phone!=mcc.get(ac.Id).phone)
           {
               ac.Description='phoneNumber is updated';
           }
        }
        
     }
    public static void afterUpdate(list<account> acc,map<id,account> mcc)
    {
        
    }
        
    }