@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        
        // Call the method that invokes a callout
        String countryChoice = 'India';
        List<String> result = ParkLocator.Country(countryChoice);
        
        // Verify that a fake result is returned
        System.assertEquals('Park1', result[0]);
        System.assertEquals('Park2', result[1]);
        System.assertEquals('Park3', result[2]);
    }
}