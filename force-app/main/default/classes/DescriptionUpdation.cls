public class DescriptionUpdation{
public static void insertion(list<Opportunity> opp){
for(Opportunity op:opp){
if(op.Amount<500000 && op.amount>100000)
{
op.description='Hot Opportunity';
}
}
}
}