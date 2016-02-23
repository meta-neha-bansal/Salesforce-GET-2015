/*
* Name:AccountAddressFilterController
* Since:27-1-2016
* Author:Neha Bansal
* Description:It is used to Filter accounts records on the basis of  billingcity,billingCountry and billingState.
*/  
public class AccountAddressFilterController {
    // For the city
    public string getBillingCitystring{get;set;}
    // For the State
    public string getBillingStatestring{get;set;}
    // For the Country
    public string getBillingCountrystring{get;set;}
    // To store the Account
    public boolean accountBlockPopup{get;set;}
    public boolean buttonBlockPopup{get;set;}
    
    public String Query{get;set;}
    Integer noOfRecords = 5;
    Public Integer totalPages{get;set;}
    
     // instantiate the StandardSetController from a query locator
    public ApexPages.StandardSetController setCon {get;set;}
    
    public AccountAddressFilterController(){
        accountBlockPopup=false;
        buttonBlockPopup=false;
        totalPages = 0;
    }
    
     // instantiate list of account objects 
    public List<Account> createAccountList {
        get                                                      
        {
            return (List<Account>) setCon.getRecords();
        }set;
    }
    
    
    public void searchRecords(){
        accountBlockPopup =true;
        buttonBlockPopup=true;
        createAccountList= new list<Account>();
        Query = 'SELECT id,name,billingcity,billingCountry,billingState FROM Account where ';
        if(string.isBlank(getBillingCitystring)  && string.isBlank(getBillingStatestring) && string.isBlank(getBillingCountrystring)) 
        {
            Query = 'SELECT id,name,billingcity,billingCountry,billingState FROM Account';
        }    
        if(!(string.isBlank(getBillingCitystring)))
        {
            Query = Query + 'billingcity LIKE \'%'+getBillingCitystring+'%\' AND ';
            
        }
        if(!(string.isBlank(getBillingCountrystring)))
        {
            Query = Query + ' billingcountry  LIKE  \'%'+getBillingCountrystring+'%\' AND ';
        }
        if(!(string.isBlank(getBillingStatestring)))
        {
            Query = Query +  ' billingstate LIKE  \'%'+getBillingStatestring+'%\' AND ';
        }
        if(Query.substring(Query.length()-4,Query.length()).equals('AND '))
        {
            Query= Query.substring(0,Query.length()-4);
        }      
        setCon = new ApexPages.StandardSetController(Database.getQueryLocator(Query));
        setCon.setPageSize(noOfRecords);
        totalPages = (setCon.getResultSize() / setCon.getPageSize());
        totalPages = Integer.valueOf(totalPages + ((Math.mod(setCon.getResultSize(), noOfRecords)>0) ? 1 : 0));
        
        
    }
    
}