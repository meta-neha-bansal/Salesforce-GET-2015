public class AddressFilterWithPagination {
    
   public list <account> accountList {get;set;}  
   private Account account {get;set;}
   public string BillingCity {get;set;}
   public string BillingState {get;set;}
   public string BillingCountry {get;set;}
   private integer totalRecs = 0;
   private integer OffsetSize = 0;
   private integer LimitSize= 10; 
   public AddressFilterWithPagination(ApexPages.StandardController stdController) {  
       totalRecs = [select count() from account];
       
   }  
   public void search(){  
     string searchquery='select name,id from account where BillingCity like \'%'+BillingCity+'%\' AND BillingState like \'%'+BillingState+'%\' AND BillingCountry like \'%'+BillingCountry+'%\' Limit 20 OFFSET :OffsetSize';  
     accountList= Database.query(searchquery);  
   }  
   public void clear(){  
   accountList.clear();  
   }  
    
   public void FirstPage()
    {
    OffsetSize = 0;
    }
    public void previous()
    {
    OffsetSize = OffsetSize - LimitSize;
    }
    public void next()
    {
    OffsetSize = OffsetSize + LimitSize;
    }
    public void LastPage()
    {
    OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
    }
    public boolean getprev()
    {
    if(OffsetSize == 0)
    return true;
    else
    return false;
    }
    public boolean getnxt()
    {
    if((OffsetSize + LimitSize) > totalRecs)
    return true;
    else
    return false;
    } 
    
    

}