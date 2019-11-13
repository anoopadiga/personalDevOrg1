public class AnimalLocator {
	public static String getAnimalNameById(Integer Id){
		String animal_Name = '';
        String animal_Food = '';
        String animal_Sound = '';
        
        Http http = new Http();

		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+Id);
		request.setMethod('GET');

		HttpResponse response = http.send(request);
		
		// If the request is successful, parse the JSON response.
		if (response.getStatusCode() == 200) {
			// Deserializes the JSON string into collections of primitive data types.
			Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
			Map<String, Object> animals = (Map<String, Object>) results.get('animal');
			animal_Name = (string)animals.get('name');
            animal_Food = (string)animals.get('eats');
            animal_Sound = (String)animals.get('says');
            system.debug('Request Success: StatusCode:'+response.getStatusCode()+':Status:'+response.getStatus()+':animal_Name:'+animal_Name+':animal_Food:'+animal_Food+':animal_Sound:'+animal_Sound);
		}
		else{
			system.debug('Request Failure: StatusCode:'+response.getStatusCode()+':Status:'+response.getStatus());
		}
        return animal_Name;
	}
}