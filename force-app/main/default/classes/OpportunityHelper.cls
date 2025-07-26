public class OpportunityHelper {
    
    // Static constant Map declared outside for reusability
    private static final Map<String, String> STAGE_DESCRIPTIONS = createStageDescriptions();

    // Method to initialize the map (static block alternative)
    private static Map<String, String> createStageDescriptions() {
        return new Map<String, String>{
            'Prospecting' => 'This opportunity is in the initial stage.',
            'Qualification' => 'Opportunity is being evaluated.',
            'Needs Analysis' => 'Customer requirements are being gathered.',
            'Proposal' => 'Proposal has been sent to the client.',
            'Negotiation' => 'Price and terms are being discussed.',
            'Closed Won' => 'Opportunity successfully won!',
            'Closed Lost' => 'Unfortunately, the deal was lost.'
        };
    }

    public static void updateOpportunityDescription(List<Opportunity> newOpportunities) {
        for (Opportunity opp : newOpportunities) {
            if (opp.StageName != null) {
                opp.Description = getDescriptionForStage(opp.StageName);
            }
        }
    }

    private static String getDescriptionForStage(String stageName) {
        return STAGE_DESCRIPTIONS.containsKey(stageName) ? STAGE_DESCRIPTIONS.get(stageName) : 'Stage not defined.';
    }
}