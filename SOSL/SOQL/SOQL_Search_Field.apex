List<List<SObject>> leadList=[FIND 'MyTutorialRack' IN NAME FIELDS Returning lead(name,phone where createddate=THIS_FISCAL_QUARTER)];
  System.debug('results are '+leadList);