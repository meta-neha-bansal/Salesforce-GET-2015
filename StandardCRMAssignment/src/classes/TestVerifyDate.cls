@isTest
public class TestVerifyDate {
    @isTest static void test1(){
        Date date1 = Date.newInstance(2015, 2, 17);
        Date date2 = Date.newInstance(2015, 2, 19);
        Date output = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(date2, output);
    }
    
    @isTest static void test2(){
        Date date1 = Date.newInstance(2015, 3, 17);
        Date date2 = Date.newInstance(2015, 3, 15);
        Date output = VerifyDate.CheckDates(date1,date2);
        Date expected = Date.newInstance(2015, 3, 31);
        System.assertEquals(expected, output);
    }
    
        

}