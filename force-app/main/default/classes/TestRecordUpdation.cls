@isTest
public class TestRecordUpdation {
@isTest
public static void TestingClass(){
    list<account> accList =new list<account>();
    for(INTEGER i=0;i<=5;i++){
        Account acc=new Account();
        acc.Name='testing'+i;
        acc.Industry='media';
        accList.add(acc);
    }
    insert accList;
    list<account> acs=[select id,name,rating from account where id=:accList[0].id];
    System.assertEquals('Hot',acs[0].Rating);
}
}