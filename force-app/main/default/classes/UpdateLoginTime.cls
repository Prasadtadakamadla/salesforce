public class UpdateLoginTime {
    public static void LoginTime(list<User> newuser,map<id,user>olduser){
        Map<Id, DateTime> userLoginMap = new Map<Id, DateTime>();
        for(user u:newuser)
        {
            if(u.LastLoginDate!=null && u.LastLoginDate!=olduser.get(u.id).lastLoginDate)
            {
                userLoginMap.put(u.id,u.LastLoginDate);
            }
        }
        account acc=[select id,Last_Login_Date__c from  account where ownerid in:userLoginMap.keyset()];
    }
}