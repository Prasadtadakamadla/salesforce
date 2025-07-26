public class customObject {
    public static void insertingList(list<Booking__c> booking,Map<id,booking__c> bookmap){
        Map<Id, booking__c> opptobeupdated = new Map<Id,booking__c>();
        for(Booking__c Book:booking){
            if(bookmap!=null && bookmap.containsKey(book.id) && book.name!=bookmap.get(book.id).name){
                opptobeupdated.put(book.id,book);
            }
                System.debug(opptobeupdated);
            }
        
    }
}