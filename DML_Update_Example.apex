//fetch the invoice records which we created
//update the status of the invoice records to Paid if they are not in the paid status

//query
List<APEX_Invoice__c> invoiceList=[select Id, Name, APEX_Status__c, createdDate from APEX_Invoice__c];

//create a list to store the records which we need to update
List<apex_invoice__c> updatedInvoiceList=new List<apex_invoice__c>();

//enhanced for loop
for(Apex_Invoice__c obj:invoiceList)
{
  if(obj.APEX_Status__c!='Paid')
  {
    obj.APEX_Status__c='Paid';
    updatedInvoiceList.(obj);
  }
}

update updatedInvoiceList;
System.debug('List has been updated and updated value of records are :' +updatedInvoiceList);