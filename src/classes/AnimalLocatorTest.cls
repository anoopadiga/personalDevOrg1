@isTest
public class AnimalLocatorTest {
    @isTest static void testGetAnimalNameById() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent from the class that implements HttpCalloutMock. 
        string response = AnimalLocator.getAnimalNameById(316);
        System.assertEquals('John McClane', response);
    }
}