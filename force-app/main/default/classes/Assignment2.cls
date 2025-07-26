//Trigger to Prevent Duplicate Records
public class Assignment2 {
    public static void DuplicateLeads(list<Lead> leads){
        list<lead> lea=new list<lead>();
        for(lead l:leads){
            l.LeadSource='Web';
            lea.add(l);
        }
    }
}