public with sharing class IntegrationClass {
    public static void integrateData() {
        // Implementation for data integration
    }
    public class Integration{
        public list<IntegrationRequest> result;
        public String Error;
    
    }
    public class IntegrationRequest {
        Public String Times;
        Public String Station;
        Public String Land;
    }

    public static void processIntegrationRequests()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://global-warming.org/api/temperature-api');
        request.setMethod('GET');
        HttpResponse res= http.send(request);
        if (res.getStatusCode() == 200) {
            String DataString=res.getBody();
            Integration integrationResponse = (Integration)json.deserialize(DataString, Integration.class);

            if(integrationResponse!=null && integrationResponse.error!=null)
            {
                for(IntegrationRequest req : integrationResponse.result)
                {
                  System.debug(req.Times);
                  System.debug(req.Station);
                  System.debug(req.Land);
                }
            }
        }
            
    }
}