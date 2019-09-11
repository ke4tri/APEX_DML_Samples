//fetch the record which we want to update
//update the description of  record with external id 1234
//create 10 more customer records

List<Apex_customer__c>customerList= new List<Apex_customer__c>();

Apex_customer__c cus=[select id, apex_external_id__c, apex_customer_description__c from apex_customer__c 
  where apex_external_id__c ='1234'];

cus.apex_customer_description__c='hello how are you';

customerList.add(cus);

for(Integer i=1;i<=10;i++)
{
  apex_customer__c objCust=new apex_customer__c(name='Test' +i,apex_external_id__c='1234' +i);
  customerList.add(objCust);
}

upsert customerList;