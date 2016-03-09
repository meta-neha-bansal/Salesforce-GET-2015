public class StringArrayTest {
    public static List<String> generateStringArray(Integer n){
        List<String> result = new List<String>();
        for(Integer i=0;i<n;i++)
        {
            String str = 'Test '+i;
            result.add(str);
            
        }
        return result;
        
    }

}