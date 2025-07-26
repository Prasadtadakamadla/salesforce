public class Integration1 {
public static void makeRequest()
{
http ht=new http();
HttpRequest req=new HttpRequest();
req.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
req.setMethod('get');
HttpResponse hr=ht.send(req);
    
if(hr.getStatuscode()==200)
{
    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(hr.getBody());
    List<Object> animals = (List<Object>) results.get('animals');
    System.debug('Received the following animals:');
    for(Object animal: animals) {
        System.debug(animal);
    }
}
}
}