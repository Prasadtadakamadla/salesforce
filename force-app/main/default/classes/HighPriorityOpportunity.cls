public class HighPriorityOpportunity {
public static void sendHighPriorityEmails(List<Opportunity> opportunities) {
    list<task> tlist=new list<task>();
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
    for(opportunity opp:opportunities){
        if(opp.Amount>100000)
        {
            Task t=new Task();
            t.WhatId=opp.Id;
            t.Priority='High';
            t.Subject='other';
            t.status='inprogress';
            tlist.add(t);  
            messaging.singleEmailMessage email=new  messaging.singleEmailMessage();
            email.setToAddresses(new List<String>{[select Email from user where id=:opp.OwnerId].email});
            email.setSubject('High-Priority Opportunity: ' + opp.Name);
            email.setPlainTextBody('Please prioritize the opportunity ' + opp.Name + 
                                       ' for GE Aerospace products (Amount: $' + opp.Amount + ').');
            emails.add(email);
        }
        insert tlist;
    }
}
}