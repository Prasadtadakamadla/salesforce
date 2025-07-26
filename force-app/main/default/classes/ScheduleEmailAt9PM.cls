public class ScheduleEmailAt9PM implements Schedulable {
    private String customerId;
    private String customerEmail;

    public ScheduleEmailAt9PM(String customerId, String customerEmail) {
        this.customerId = customerId;
        this.customerEmail = customerEmail;
    }

    public void execute(SchedulableContext sc) {
        sendEmail(customerEmail);
    }

    public void sendEmail(String email) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[]{email});
        mail.setSubject('Welcome to Our Service!');
        mail.setPlainTextBody('Hello, Thank you for joining us. We are excited to have you!');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }

    public static void scheduleEmailJob(String customerId, String email) {
        // Calculate the next 9 PM
        Datetime now = System.now();
        Datetime next9PM = Datetime.newInstance(now.year(), now.month(), now.day(), 21, 0, 0);

        if (now.hour() >= 21) {
            // If it's already past 9 PM, schedule for tomorrow
            next9PM = next9PM.addDays(1);
        }

        String cronExp = next9PM.format('s m H d M ? yyyy').replace(' ', ' 0 0 '); // Format: "0 0 21 * * ?"
        String jobName = 'CustomerEmailJob_' + customerId;

        System.schedule(jobName, cronExp, new ScheduleEmailAt9PM(customerId, email));
    }
}