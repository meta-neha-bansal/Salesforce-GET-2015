@isTest
public class DaysInfoTest {
    
    @isTest
    public static void testCountNoOfWorkingDays(){
        Date startDate = Date.newInstance(2016, 2, 3);
        Date lastDate = Date.newInstance(2016, 2, 17);
        Integer expected = 11;
        Integer actual = DaysInfo.countNoOfWorkingDays(startDate,lastDate);
        System.assertEquals(expected, actual);
        
    }

}