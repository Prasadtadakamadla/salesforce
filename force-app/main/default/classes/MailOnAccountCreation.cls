public class MailOnAccountCreation {
    @future
    public static void EmailIsManatory(ID id){
         Contact co = [SELECT id,email,firstName FROM Contact WHERE id = :id];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] { co.email }); // replace with admin or support
        mail.setSubject('Welcome Onboard');
        mail.setPlainTextBody('Hi' + co.FirstName + 'Your are successfully a user now');

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    public static void ContactCreationInAccount(list<contact> co){
        for(contact con:co){
            if(con.email==null){
                con.addError('Please enter the email');
            }
        }
    }
}