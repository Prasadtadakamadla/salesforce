public class UpdateIndustry {
    public static void Updation(list<account> ac,map<id,account> oldmap){
        list<contact> c=new List<contact>();
        for(account acc:ac){
            contact cs=new contact();
            if(acc.industry!=null && acc.industry!=oldmap.get(acc.id).industry )
            {
               cs.Individual__c=acc.industry;
            }
        }
    }
}