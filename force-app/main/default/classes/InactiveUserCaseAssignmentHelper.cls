public class InactiveUserCaseAssignmentHelper {

    @future
    public static void checkAndAssignCases(Set<Id> userIds) {
        // Get users who are inactive (last login > 30 days ago)
        List<User> inactiveUsers = [SELECT Id, Manager__c, LastLoginDate FROM User WHERE Id IN :userIds AND LastLoginDate < :System.now().addDays(-30)];

        // List to store cases that need to be reassigned
        List<Case> casesToUpdate = new List<Case>();

        // Loop through each inactive user and fetch their cases
        for (User user : inactiveUsers) {
            // Fetch cases where the owner is the inactive user
            List<Case> cases = [SELECT Id, OwnerId FROM Case WHERE OwnerId = :user.Id];

            // Assign each case to the user's superior (Manager__c)
            for (Case c : cases) {
                c.OwnerId = user.Manager__c; // Assign to the manager (superior)
                casesToUpdate.add(c);
            }
        }

        // If there are cases to update, perform the update in bulk
        if (!casesToUpdate.isEmpty()) {
            update casesToUpdate;
        }
    }
}