public class recurission {
    public static Boolean isRecursive = false;
public static void Recursive_function(list<contact> co,map<id,contact> oldmap)
    {
        if (isRecursive) return;
        for(contact con:co)
        {
            if(con.LastName!=oldmap.get(con.Id).LastName)
            {
                con.Phone='8121888050';
            }
            
        }
        update co;
    }
        
}