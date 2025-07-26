public class Tesk8 {
    public static void preventHighValueClosedLost(List<Opportunity> newOpportunities, Map<Id, Opportunity> oldOpportunities) {
        for (Opportunity newOpp : newOpportunities) {
            Opportunity oldOpp = oldOpportunities.get(newOpp.Id);

            // Null check for oldOpp to avoid NullPointerException
            if (oldOpp != null && newOpp.StageName == 'Closed Lost' && oldOpp.StageName != 'Closed Lost' && newOpp.Amount > 50000) {
                newOpp.addError('Opportunity with an amount greater than 50,000 cannot be marked as Closed Lost.');
            }
        }
    }
}