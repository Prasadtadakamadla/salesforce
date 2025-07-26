public class PreventDuplicateContact {
    public static void PreventDuplication(list<contact> con){
    set<String> newcontactids = new set<String>();
        
        for(contact c:con){
            if(c.Accountid!=null && c.email!=null){
                newcontactids.add(c.email.toLowerCase());
}
        }
        set<String> oldcontactids = new set<String>();
        for(contact cset:[select id,accountid,email from contact where email in :newcontactids])
        {
             oldcontactids.add(cset.accountid+'-'+cset.Email.toLowerCase());
        }
        for(contact c:con){
            String temp=c.accountid+'-'+c.Email.toLowerCase();
                
              if(oldcontactids.contains(temp))
            {
                c.addError('A contact with this Email already exists for this Account.');
}
        }
        
    }
}