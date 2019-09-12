List<apex_customer__c> customerListToDel=[select id from apex_customer__c where apex_customer__c.Name LIKE 'Test%'];

delete customerListToDel;

System.debug('SUCCESS, ' +customerListToDel.size()+' records has been deleted');
