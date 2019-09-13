List<apex_customer__c> fetchDelCustomers=[select id from apex_customer__c where apex_customer__c.Name LIKE 'Test%' ALL ROWS];

undelete fetchDelCustomers;
System.debug('SUCCESS,' +fetchDelCustomers.size() +' records have been undeleted');
