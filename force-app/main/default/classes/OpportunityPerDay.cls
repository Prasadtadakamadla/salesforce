public class OpportunityPerDay {
    public static final string ProfileName='SYSTEM ADMIN';
    public static void OpportunityCreationperday(list<Lead> leads){
for(lead l:leads)
{
    profile p=[select id,name from profile where name=:profileName];
    Task t=new task(whatid=l.id,status='In Progress',OwnerId=p.name);
}
   
            }
    
}