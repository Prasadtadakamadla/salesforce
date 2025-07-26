public class TestingIntegration {

    public class TemperatureResponse {
        public String error;
        public List<TemperatureRecord> result;
    }

    public class TemperatureRecord {
        public String times;
        public String station;
        public String land;
    }

    public static void integration() {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://global-warming.org/api/temperature-api');
        req.setMethod('GET');

        try {
            HttpResponse res = http.send(req);
            System.debug('Status: ' + res.getStatus());
            String responseBody = res.getBody();
            System.debug('Body: ' + responseBody);

            TemperatureResponse tempResponse = (TemperatureResponse) JSON.deserialize(responseBody, TemperatureResponse.class);

            if (tempResponse.error == null) {
                for (TemperatureRecord rec : tempResponse.result) {
                    System.debug('Time: ' + rec.times + ', Station: ' + rec.station + ', Land: ' + rec.land);
                }
            } else {
                System.debug('API returned error: ' + tempResponse.error);
            }

        } catch (CalloutException e) {
            System.debug('Callout error: ' + e.getMessage());
        }
    }
}