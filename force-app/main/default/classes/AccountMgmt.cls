@RestResource(urlMapping='/accountmgmt/')
global class AccountMgmt {
@HttpGet
    global static AccountWrapper getTopAccounts() {
        Map<String, String> paramsMap = RestContext.request.params;
        String accIndustry = paramsMap.get('industry');
        
        if (String.isBlank(accIndustry)) {
            throw new IllegalArgumentException('Industry parameter is required');
        }

        List<Account> accList = [
            SELECT Id, Industry, Rating, AnnualRevenue 
            FROM Account 
            WHERE AnnualRevenue != null 
            AND Industry = :accIndustry 
            ORDER BY AnnualRevenue DESC 
            LIMIT 10
        ];

        if (accList.isEmpty()) {
            throw new IllegalArgumentException('No accounts found for the given industry');
        }

        List<Contact> conList = [
            SELECT Id, LastName, FirstName, Email 
            FROM Contact 
            WHERE AccountId IN :accList
        ];
        List<Case> caseList = [
            SELECT Id, Priority, Subject 
            FROM Case 
            WHERE AccountId IN :accList
        ];

        AccountWrapper accWrapper = new AccountWrapper();
        accWrapper.accList = accList;
        accWrapper.conList = conList;
        accWrapper.caseList = caseList;

        return accWrapper;
    }

@HttpPost
    /*global static String createAccount(String accName, String accRating, String accIndustry) {
        if (String.isBlank(accName)) {
            throw new IllegalArgumentException('Account name is required');
        }
        if (String.isBlank(accIndustry)) {
            throw new IllegalArgumentException('Industry is required');
        }

        Account acc = new Account();
        acc.Name = accName;
        acc.Rating = accRating;
        acc.Industry = accIndustry;

        try {
            insert acc;
            return 'Account created successfully with ID: ' + acc.Id;
        } catch (DmlException e) {
            throw new IllegalArgumentException('Failed to create account: ' + e.getMessage());
        }
    }*/

   global static String createAccountandContact(AccountInformation information) {
    if (information == null || information.accountRecord == null || information.contactRecord == null) {
        throw new IllegalArgumentException('Account and Contact information are required');
    }
    if (String.isBlank(information.accountRecord.Name)) {
        throw new IllegalArgumentException('Account name is required');
    }
    if (String.isBlank(information.accountRecord.Industry)) {
        throw new IllegalArgumentException('Industry is required');
    }

    Account accrecord = information.accountRecord;
    Contact conrecord = information.contactRecord;
    insert accrecord;
    conrecord.AccountId = accrecord.Id;
    insert conrecord;
    return 'Account and contact record inserted';
}
@HttpDelete
global static String deleteAccount() {
    Map<String, String> paramsMap = RestContext.request.params;
    String accountId = paramsMap.get('accId');
    
    if (String.isBlank(accountId)) {
        throw new IllegalArgumentException('Account ID parameter (accId) is required');
    }

    Account acc;
    try {
        acc = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
    } catch (QueryException e) {
        throw new IllegalArgumentException('No account found for the given ID: ' + accountId);
    }

    try {
        delete acc;
        return 'Record deleted successfully';
    } catch (DmlException e) {
        throw new IllegalArgumentException('Failed to delete account: ' + e.getMessage());
    }
}
    global class AccountWrapper {
        global List<Account> accList;
        global List<Contact> conList;
        global List<Case> caseList;
    }
    global class AccountInformation{
        global Account accountRecord {get;set;}
        global Contact contactRecord {get;set;}
        
    }
    
}