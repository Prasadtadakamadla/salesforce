public with sharing class InsertingtwoDML {
    public static void insertTwoDML() {
    list<sObject> lst=new list<sObject>();
        account acc=new account(name='Test Account');
        lst.add(acc);
        contact con=new contact(Lastname='Test con');
        lst.add(con);

        insert lst;

}
}