public class Assignment10 {
    public static void countofchild(list<contact> con,map<id,contact> oldmap){
        set<id> hold =new set<id>();
        for(contact co:con){
            if(co.accountid!=null){
                hold.add(co.accountid);
            }
        }
        map<id,integer> ic=new map<id,integer>();
       for(AggregateResult ar : [SELECT AccountId, COUNT(Id) cnt FROM Contact WHERE AccountId IN :hold GROUP BY AccountId])
       {
            ic.put((id) ar.get('AccountId'), (integer) ar.get('cnt'));
       }
        
    }
    }