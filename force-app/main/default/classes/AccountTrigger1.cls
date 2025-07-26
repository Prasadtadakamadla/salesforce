public class AccountTrigger1 {
    public static void newAccount(Account acc){
        list <contact>conlist =[select id,name,phone from contact where accountid=:acc.id];
        for(contact con:conList)
        {
       
            con.id=acc.id;
            con.phone=acc.phone;
                update con;
        }
        
    }
    
}