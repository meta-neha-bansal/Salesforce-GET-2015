/*
 * Name:OnlinePurchaseOrderController
 * Author:Neha Bansal
 * Since:29-1-2015
 * Desription : It is an imlementation of Online Purchase Order System.
 */ 

public class OnlinePurchaseOrderController {
    
    public List<PurchaseOrderLineItem__C> PurchaseOrderLineItemList {get; set;}
    public map<Id,PurchaseOrderLineItem__C> PurchaseOrderLineItemMap{get; set;}
    public boolean showProductLineItems{get; set;}
    public boolean ProductLineItemsBlockPopup{get; set;}
    public boolean ProductBlockPopup{get; set;}
    public boolean payBlockPopup{get; set;}
    public boolean deliveryStatusPopup{get; set;}
    public Id productId {get; set;}
    public PurchaseOrder__c orderObject{get;set;}
    public Date deliveryDate{get;set;}
    
    
    public OnlinePurchaseOrderController(ApexPages.StandardController controller) {
    }

    public List<Product2> productList { get; set; }

    public OnlinePurchaseOrderController(){
        PurchaseOrderLineItemList = new List<PurchaseOrderLineItem__C> ();
        PurchaseOrderLineItemMap = new map<Id,PurchaseOrderLineItem__C>();
        orderObject =new PurchaseOrder__c();
        showProductLineItems = False;
        ProductLineItemsBlockPopup = true;
        ProductBlockPopup = true;
        payBlockPopup = false;
        deliveryStatusPopup = false;
        productList = [SELECT ProductCode, UnitPrice__C, Name FROM Product2 ];
    }
    public void addToCard()
    {
        
        showProductLineItems = True;
        system.debug('id is' +productId);
        Product2 ProductToAdd = [Select id,name,unitPrice__c From Product2 Where id = :productid];
        PurchaseOrderLineItem__C lineItemObject;
        if(PurchaseOrderLineItemMap.containsKey(productId))
        {
            
            lineItemObject = PurchaseOrderLineItemMap.get(productId);
            lineItemObject.Quantity__c+=1;
            update lineItemObject;
        }
        else
        {
            lineItemObject = new PurchaseOrderLineItem__C();
            lineItemObject.name = ProductToAdd.name;
            lineItemObject.Quantity__c = 1;
            lineItemObject.product__C = productId;
            if(ProductToAdd.UnitPrice__c == null)
            {
                lineItemObject.UnitPrice__c = 0;
            }
            else
            {
                lineItemObject.UnitPrice__c = ProductToAdd.UnitPrice__c;
            }
            PurchaseOrderLineItemList.add(lineItemObject);
            PurchaseOrderLineItemMap.put(productId, lineItemObject);
            insert lineItemObject ;
        }
       
    }
    public void procccedToPay()
    {
        
        ProductLineItemsBlockPopup = false;
        ProductBlockPopup = false;
        payBlockPopup = true;
        Decimal price = 0;
        for(Id key : PurchaseOrderLineItemMap.keySet())
        {
            PurchaseOrderLineItem__C itemObject = PurchaseOrderLineItemMap.get(key);
            price = price + (itemObject.UnitPrice__c * itemObject.Quantity__c) ;
        }
        orderObject.TotalPrice__c = price;
    }
    
    public void pay()
    {
        payBlockPopup = false;
        deliveryStatusPopup = true;
        insert orderObject;
        deliveryDate = Date.today().addDays(15);
        for(Id key : PurchaseOrderLineItemMap.keySet())
        {
            PurchaseOrderLineItem__C itemObject = PurchaseOrderLineItemMap.get(key);
            itemObject.PurchaseOrder__c = orderObject.id;
        }
        update(PurchaseOrderLineItemMap.values());
        
    }

}