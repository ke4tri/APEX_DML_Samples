APEX_Customer__c objCust=new APEX_Customer__c();
objCust.Name='Test';
insert objCust; //DML Query

//add 2 invoice
//create a list
List<apex_invoice__c> InvoiceListToInsert=new List<apex_invoice__c>();

//first invoice object
APEX_Invoice__c objNewInvoice=new APex_Invoice__c();
objNewInvoice.APEX_Status__c='Pending';
objNewInvoice.APEX_Customer__c=objCust.id;
objNewInvoice.APEX_Amount_Paid__c=1000;
InvoiceListToInsert.add();

//create a second invoice
APex_Invoice__c objNewInvoice2=new APex_Invoice__c();
objNewInvoice2.APEX_Status__c='Pending';
objNewInvoice2.APEX_amount_paid__c=700;
InvoiceListToInsert.add(objNewInvoice2);

Database.SaveResult[] srList=Database.insert(InvoiceListToInsert, false);
for(Database.SaveResult sr:srList)
{
  if(sr.isSuccess())
  {
    System.debug('Successfully inserted the invoice ' +sr.getId());
  }
  else
  {
    for(Database.Error objErr:sr.getErrors())
    {
      System.debug('The following error has ocurred');
      System.debug(objErr.getStatusCode()+' : '+objErr.getMessage());
      System.debug('Invoice object fields which are affected ' +objErr.getFields());
    }
  }
}

