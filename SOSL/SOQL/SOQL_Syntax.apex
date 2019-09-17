SELECT ***fieldList*** [subquery][...]
[TYPEOF typeOfField whenExpression[...] elseExpression END][...]
FROM objectType[,...]
  [USING SCOPE filterScope]
[WHERE conditionExpression]
[WITH[DATA CATEGORY] filteringExpression]
[GROUP BY{fieldGroupByList|ROLLUP (fieldSubtotalGroupByList)|CUBE (fieldSubtotalGroupByList)}
  [HAVING havingConditionExpression]]
[ORDER BY fieldOrderByList {ASC|DESC}[NULLS{FIRST|LAST}]]
[LIMIT numberOfRowsToReturn]
[OFFSET numberOfRowsToSkip]
[FOR{VIEW | REFFERENCE}[,...]]
  [UPDATE{TRACKING|VIEWSTAT}[,...]]


//typeOfField -The What relationship field of an Event coud be an Account, a Campaign, or an Opportunity
// from the Query Editor
Select TYPEOF What
When Account THEN Phone,NumberOfEmployees

When Opportunity THEN Amount,CloseDate
Else Name,Email
END
FROM EVENT

// from the Debug
List<SObject>s=[Select TYPEOF What
When Account THEN Phone,NumberOfEmployees

When Opportunity THEN Amount,CloseDate
Else Name,Email
END
FROM EVENT];
System.debug(s);
////////////////////////////////////////////////

//GroupBy
//from the Query Editor
Select LeadSource,COUNT(Name) from LEAD GROUP BY LeadSource
// then can run 
Select count() from Lead

// ESCAPED CHARACTER EXAMPLES
SELECT ID, Name FROM Account WHERE Name LIKE 'Ter%'
// Seelct all accounts whose name begins with the three character sequence 'Ter'

SELECT ID, Name FROM Acount WHERE Name LIKE 'Ter\%'
// Select all accounts whose name exactly matches the four character sequence 'Ter%'

SELECT ID, Name FROM Account WHERE Name LIKE 'Ter\%%'
//Select all accounts whose name begins with the four character sequence 'Ter%'

//Statement Character Limit
// SOQL statements cannot exceed 20,000 characters in length. or SOQL statements that
//exceed this maximum length, the API returns a MALFORMED_QUERY exception code;
//no result rows are returned.

//NULL
Select AccountId,Account.Name From Event where ActivityDate!=null 

Select Id from case where Contact.LastName=null

//Querying Multi-Select PickLists
/The following query will filter values in the Subject__c field that equal to Computer and English

SELECT Id,Subject__c FROM CustObj__c WHERE Subject__c='Computer;English'

SELECT Id,Subject__c from CustObj__c WHERE Subject__c includes('Computer;English','Maths')


// fetch the records via SOQL
List<apex_invoice__c> invoiceList=new List<apex_invoice__c>();
invoiceList=[select id, name, Apex_customer__r.Name,Apex_Status__c from Apex_Invoice__c where createDate=today
And APEX_Customer__r.Name!='Test'];

System.debug('We have total of '+invoiceList.size()+ ' records in the list');
for(APEX_Invoice__c objInvoice:invoiceList)
{
  System.debug('Invoice record '+objInvoice); 
}