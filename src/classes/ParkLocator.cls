public class ParkLocator {
	public static List<String> country(string Country_Of_Choice) {
        ParkService.ParksImplPort parking = new ParkService.ParksImplPort();
        return parking.byCountry(Country_Of_Choice);
    }
}