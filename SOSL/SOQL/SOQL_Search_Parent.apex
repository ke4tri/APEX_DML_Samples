//fetch parent record using SOQL

List<apex_invoice__c> ListOfInvoicesWithCustomerName=new List<apex_invoice__c>();
ListOfInvoicesWithCustomerName=[Select id,name, Apex_Customer__r.Name from apex_invoice__c LIMIT 10];

  for(apex_invoice__c objInv:ListOfInvoicesWithCustomerName)
    {
      System.debug('Invoice Customer name is '+objInv.Apex_Customer__r.Name);
    }