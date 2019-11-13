@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(Object stub, Object request, Map<String, Object> response, String endpoint, String soapAction, String requestName, String responseNS, String responseName, String responseType) {
	   
	   // start - specify the response you want to send
	   ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
	   
	   List<String> parkNames = new List<String>();
	   string parkName1 = 'Park1';
	   string parkName2 = 'Park2';
	   string parkName3 = 'Park3';
	   parkNames.add(parkName1);
	   parkNames.add(parkName2);
	   parkNames.add(parkName3);
	   
	   response_x.return_x = parkNames;
	   // end
	   
	   response.put('response_x', response_x); 
   }
}