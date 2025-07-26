public class ArchiveInactiveCases implements Schedulable {
public void execute(SchedulableContext sc)
{
 DateTime thirtyDaysAgo = System.now().addDays(-30);  
    list<case> cases=[select id,status,lastmodifiedDate from case where lastmodifiedDate<: thirtyDaysAgo AND status!='closed' ];
    for(case c:cases){
        if(c.status!=null && c.status!='closed'){
            c.status='closed';
        }
    }
    update cases;
}
}