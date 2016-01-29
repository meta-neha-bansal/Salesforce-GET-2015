public class DaysInfo {
    public static Integer countNoOfWorkingDays(Date startDate, Date lastDate)
    {
       
        Date dueDate = Date.newInstance(2008, 1, 30);
        Integer numberDaysDue = startDate.daysBetween(lastDate);
        Integer numberOfWeeks = numberDaysDue/7;
        Integer numberOfWorkingDays = numberOfWeeks*5;
        Date tempDate = startDate.addDays(numberOfWeeks*7);
       
        while(tempDate<=lastDate)
        {
			 Datetime dt = DateTime.newInstance(tempDate, Time.newInstance(0, 0, 0, 0));
             String dayOfWeek=dt.format('EEEE');
            
             if(dayOfWeek =='Monday' ||dayOfWeek =='Tuesday'||dayOfWeek =='Wednesday'||dayOfWeek =='Thursday'||dayOfWeek =='Friday')
             {
                 numberOfWorkingDays++;
             }
            tempDate = tempDate.addDays(1);
        }   

        return numberOfWorkingDays;
    }

}