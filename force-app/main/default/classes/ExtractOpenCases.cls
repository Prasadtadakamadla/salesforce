public with sharing class ExtractOpenCases {

public static Integer getOpenCasesCount() {
    if (!Schema.sObjectType.Case.isAccessible()) {
        return 0;
    }
    List<AggregateResult> results = [SELECT count(Id) total FROM Case WHERE Status != 'Closed'];
    if (!results.isEmpty()) {
        Object totalObj = results[0].get('total');
        if (totalObj != null) {
            return Integer.valueOf(String.valueOf(totalObj));
        }
    }
    return 0;
}
    public static List<Case> openCases() {
        List<Case> openCases = [SELECT Id, Subject, Status FROM Case WHERE Status != 'Closed'];
        return openCases;
    }
}