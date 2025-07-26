public class AutoCloseOldCases implements Schedulable {
    public void execute(SchedulableContext sc) {
        // Query all open cases older than 30 days
        List<Case> oldCases = [SELECT Id, Status FROM Case 
                               WHERE Status != 'Closed' 
                               AND CreatedDate <= LAST_N_DAYS:30];
        
        if (!oldCases.isEmpty()) {
            // Update case status to 'Closed'
            for (Case c : oldCases) {
                c.Status = 'Closed';
            }
            
            // Perform DML operation
            update oldCases;
            
            System.debug(oldCases.size() + ' cases closed successfully.');
        } else {
            System.debug('No old cases found.');
        }
    }
}