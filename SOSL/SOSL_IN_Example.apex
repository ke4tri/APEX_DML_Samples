List<list<sObject>> customerList=[FIND 'ABC*' IN NAME Fields RETURNING APEX_Customer__c(ID,APEX__Customer__c.Name,APEX_Cusotomer_Description__c)];
System.debug('the result is ' +customerList);

//below would search ALL fields and return all those results
List<list<sObject>> customerList=[FIND 'ABC*' IN ALL Fields RETURNING APEX_Customer__c(ID,APEX__Customer__c.Name,APEX_Cusotomer_Description__c)];


//IF you were to run this query in the Query Editor you would use this format

FIND {ABC*}
IN ALL Fields
RETURNING APEX_Customer__c(Id,APEX_Customer__c.Name,APEX_Customer_Description__c)


