// update(recordToUpdate, allOrNone)

// public static Database.SaveResult update(sObject recordToUpdate, Boolean allOrNone)
//fetch the invoice records
//update the status feilds 
List<Apex_Invoice__c> invoiceList=[select id,name,Apex_Status__c,createdDate from Apex_Invoice__c ];

//create a list to store records which we need to update
List<Apex_Invoice__c> updatedInvoiceList=new List<Apex_Invoice__c>();
for(Apex_Invoice__c objInvoice:invoiceList)
{
  if(objInvoice.Apex_Status__c =='Pending')
  {
    objInvoice.Apex_Status__c='Paid';
    updatedInvoiceList.add(objInvoice);
  }
}

Database.SaveResult[] srList=Database.update(updatedInvoiceList, false);

//iterate through each result
for(Database.SaveResult sr:srList)
{
  if(sr.isSuccess())
  {
    System.debug('Successfully updated Invoice'+sr.getId());
  }
  else
  {
    for(Database.Error objErr.sr.getErrors())
    {
      System.debug('The following error ocurred')
      System.debug(objErr.getStatusCode() +' : '+objErr.getMessage());
      System.debug('Invoice object field which are affected by the erro '+objErr.getFields());
    }
  }
}