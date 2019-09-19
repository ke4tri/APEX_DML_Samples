List<Apex_customer__c> ListCustomers=[Select id,name, (slect id,name from Invoices__r) from Apex_customer__c where Name = 'ABC Customer'
];

System.debug('List of Customers'+ListCustomers);

List<apex_invoice__c> ListOfInvoices=ListCustomers[0]; //this is the notation to fetch the child records and putting into a List
System.debug('The invoice records related to the ABC customer'+ListOfInvoices);
