
//Query searching over multiple objects

List<List<SObject>> customerAccountSearchList=new List<List<SObject>>();

customerAccountSearchList=[FIND 'ABC*' IN ALL FIELDS RETURNING APEX_Customer__c(Id,APEX_Customer__c.Name,
APEX_Customer_Descriptiong__c),
Account(Id,Name)];

System.debug('Results are '+customerAccountSearchList);
APEX_Customer__c[] searchedCustomer=(List<Apex_customer__c>)customerAccountSearchList[0];
Account[] searchedAccount=(List<Account>)customerAccountSearchList[1];

System.debug('Customer records matching the criteria '+searchedCustomer);
System.debug('Account records matching the criteria '+searchedAccount);

 