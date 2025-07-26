public class SingleOpportunityCreation {
    public static void OppotunityCreationInADay(List<Opportunity> newOpp){
        set<id> ids=new set<id>();
        for(opportunity opp:newOpp){
            ids.add(opp.AccountId);
        }
        List<Opportunity> existingOpps= [select id,AccountId, CreatedById from opportunity where accountid= :ids and CreatedById = :UserInfo.getUserId()];
            Set<String> blockedCombos = new Set<String>();
            for(Opportunity opp : existingOpps){
                blockedCombos.add(opp.Accountid+'-'+opp.CreatedById);
            }
        for (Opportunity opp : newOpp) {
               if (opp.AccountId != null) {
                   string adc=opp.Accountid+'-'+ UserInfo.getUserId();
                   if(blockedCombos.contains(adc))
                   {
                  opp.addError('You can only create one Opportunity per Account.');
                   }
                                          }
        }
     }
}