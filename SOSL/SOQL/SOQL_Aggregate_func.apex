AggregateResult[] groupedResults=[Select AVG(APEX_Amount_Paid__c) averageAmount From APEX_Invoice__c 
  where APEX_Customer__r.Name='ABC Customer'];
System.debug(groupedResults);
Object avgPaidAmount=groupedResults[0].get('averageAmount');
System.debug('average amount paid by the ABC Customer '+avgPaidAmount);

////////////MAX RESULTS USING AGGREGATE//////////////

AggregateResult[] groupedResults=[Select MAX(APEX_Amount_Paid__c)maxAmount from APEX_Invoice__c where APEX_Customer__r.Name='ABC Customer'];
     System.debug('the value of groupedResults '+groupedResults);

Object maxInvoiceAmount=groupedResults[0].get('maxAmount');
System.debug('Maximum invoice amount paid by the customer'+maxInvoiceAmount);

/////////////MIN RESULTS USING AGGREGATE/////////////

AggregateResult[] groupedResults=[Select MIN(APEX_Amount_Paid__c)minAmount from APEX_Invoice__c where APEX_Customer__r.Name='ABC Customer'];
     System.debug('the value of groupedResults '+groupedResults);

Object minInvoiceAmount=groupedResults[0].get('minAmount');
System.debug('Minimum invoice amount paid by the customer'+minInvoiceAmount);

/////////////MULTIPLE AGGREGATE FUNCTIONS IN ONE SOQL/////////////

AggregateResult[] groupedResults=[select MAX(APEX_Amount_Paid__c)maxAmount, MIN(APEX_Amount_Paid__c)minAmount,AVG(APEX_Amount_Paid__c)avgAmount
from APEX_Invoice__c where APEX_Customer__r.Name='ABC Customer'];
System.debug(groupedResults);

Object maxAmt=groupedResults[0].get('maxAmount');
Object minAmt=groupedResults[0].get('minAmount');
Object avgAmt=groupedResults[0].get('avgAmount');

System.debug('Max invoice amount paid by the ABC Customer '+maxAmt);
System.debug('Min invoice amount paid by the ABC Customer '+minAmt);
System.debug('AVG invoice amount paid by the ABC Customer '+avgAmt);

///////////////////////Binding APEX Variables :customerName////////////////////////

String customerName='ABC Customer';

List<apex_customer__c> listOfCustomer=[select Id,name,Apex_customer_status__c from Apex_Customer__c where name=:customerName];
List<apex_invoice__c> invoiceList=[select id,apex_amount_paid__c from apex_Invoice__c where apex_customer__r.name=:customerName];
System.debug('List of customers is '+listOfCustomer);
System.debug('List of invoicesis '+invoiceList);


///Trigger syntax///
trigger ***TriggerName*** on ObjectName (trigger_events){
    code_block
}

//Trigger_events can be a comma-separated list of one or more of these events:
before insert
before update
before delete
after insert
after update
after delete
after undelete   
 
