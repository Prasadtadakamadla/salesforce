public class AccountIndustryRatingUpdater {
   public static void updateAccountRating(list<account> ac){
        list<account> aList =new list<account>();
        for(account acc:ac){
            if(acc.Industry=='Technology'){
                acc.Rating='Warm';
            }
            else if(acc.Industry=='Not For Profit'){
                acc.Rating='cool';
}
            else
            {
                acc.Rating='Hot';
            }
            
        }
    }
}