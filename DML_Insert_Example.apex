// Insert
APEX_Customer__c objCust=new APEX_Customer__c(); //creates a new instance of a customer
objCust.Name='Test ABC'; //defines the name of the customer obj
insert objCust; //insert operation, it will create a new customer record

APEX_Invoice__c objNewInvoice=new APEX_Invoice__c(); //creates a new instance of customer Invoice
objNewInvoice.APEX_Status__c='Pending'; //sets invoice status field to 
objNewInvoice.APEX_Amount_Paid__c=1000; //sets invoice amount to 
objNewInvoice.APEX_Customer__c=objCust.id; //sets customer invoice customer to the id of the customer object

insert objNewInvoice; //inserts feild data into the invoice object
System.debug('Then customer we added ' +objCust + ' and the corresponding invoice for the customer :' + 
            objNewInvoice); //logs the customer object and invoice object into the 'debug console'