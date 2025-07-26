public class QueuableApex implements Queueable {

public void execute(Queueablecontext  context)
{
  list<account> accList=[select id,name from account limit 100];
    for(account acc:accList)
    {
        acc.name=acc.name+'-added';
    }
    update accList;
}
}