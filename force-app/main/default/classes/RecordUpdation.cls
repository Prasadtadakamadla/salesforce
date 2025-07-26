public class RecordUpdation{
public static void insertion(list<account> newList){
for(Account acc:newList){
if(acc.industry=='media' || acc.industry=='Energy')
{
acc.Rating='Hot';
}
}
//not required
}
}