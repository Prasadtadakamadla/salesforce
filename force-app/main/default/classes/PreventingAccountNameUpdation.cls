public class PreventingAccountNameUpdation {
    public static void PreventingUpdation(list<account> acc,map<id,account> oldmap){
        for(account ac:acc){
            if(oldmap!=null && ac.name!=null && ac.name!=oldmap.get(ac.id).name){
                ac.name.addError('you cannot modify the account name once created');
            }
        }
}
}