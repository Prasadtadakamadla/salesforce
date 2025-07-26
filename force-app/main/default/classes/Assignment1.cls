//Create a trigger that prevents deletion of a Contact if there are any related Opportunities.

public class Assignment1 {
    public static void UpdationLast_Activity_Date(list <contact> con){
        list<id> conc=new list<id>();
        Opportunity o=new Opportunity();
        for(contact co:con){
            conc.add(co.id);
    
        }
        list<Opportunity> i=[select contactId,id from Opportunity where contactId IN:conc];
    }
    
}