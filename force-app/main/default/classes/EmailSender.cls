public class EmailSender {
    public static void sendingToRecipients(List<Contact> conList) {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for (Contact co : conList) {
            if (co.Email != null) { 
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                List<String> toAddressList = new List<String>();
                toAddressList.add(co.Email);
                emailMsg.setToAddresses(toAddressList);
                emailMsg.setSubject('Welcome Message');
                String content = 'Hi ' + co.Name + '<br> Welcome to the page!';
                emailMsg.setHtmlBody(content);
                emails.add(emailMsg);
            }
        }

        // Send emails only if there are valid messages
        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}