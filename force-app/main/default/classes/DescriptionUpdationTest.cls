@istest
public class DescriptionUpdationTest{
@istest
public static void Test_insertion(){
list<opportunity> opList=new list<opportunity>();
for(integer i=0;i<=5;i++)
{
Opportunity opp =new Opportunity();
opp.Name='testOpp'+i;
opp.StageName='Prospecting';
opp.CloseDate=System.Today();
opp.Amount=200000;
opList.add(opp);
}
insert opList;
opportunity o=[select id,name,stageName,closedate,amount,Description from opportunity where id=:opList[0].id];
system.assertEquals('Hot Opportunity',o.Description);
}
}