public with sharing class ZeroBounceEmailIntegration {
    public ZeroBounceEmailIntegration() {

    }
     public class EmailValidationResponse {
        public String address;
        public String status;
        public String sub_status;
        public Boolean free_email;
        public String did_you_mean;
    }
    private static String getApiKey() {
        List<API_Configuration__mdt> configs = [SELECT API_Key_c__c
            FROM API_Configuration__mdt
            WHERE API_Name_c__c = 'zerobounce'
            LIMIT 1];
        return configs.size() > 0 ? configs[0].API_Key_c__c : null;
    }
    public static EmailValidationResponse validateEmail(String email) {
        String apiKey = getApiKey();
        if (String.isBlank(apiKey)) {
            throw new CalloutException('API Key is missing');
        }

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:zerobounce/v2/validate?api_key=' + apiKey + '&email=' + EncodingUtil.urlEncode(email, 'UTF-8'));
        request.setMethod('GET');

        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            return (EmailValidationResponse) JSON.deserialize(response.getBody(), EmailValidationResponse.class);
        } else {
            throw new CalloutException('zerobounce API error: ' + response.getBody());
        }
    }
}