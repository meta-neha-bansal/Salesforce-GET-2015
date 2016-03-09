@isTest
public class TestStack {
    Static Stack stack = new Stack();
   
    @isTest
    public static void testPush()
    {
        stack.push(1);
        System.assertEquals(1, stack.size());
    }
    @isTest
    public static void testSize()
    {
        stack.push(1);
        System.assertEquals(1, stack.size());
    }
    @isTest
    public static void testisEmpty()
    {
        System.assertEquals(True, stack.isEmpty());
    }
    @isTest
    public static void testpop_ifNotEmpty()
    {
        stack.push(2);
        System.assertEquals(2, stack.pop());
    }
     @isTest
    public static void testpop_ifEmpty()
    {
        System.assertEquals(-1, stack.pop());
    }
    @isTest
    public static void testpeek_ifNotEmpty()
    {
        stack.push(1);
        System.assertEquals(1, stack.peek());
    }
    @isTest
    public static void testpeek_ifEmpty()
    {
        System.assertEquals(-1, stack.peek());
    }

}