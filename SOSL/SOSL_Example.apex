FIND {SearchQuery} //Required. Specifies the text (words) to search for. Enclose in braces
//FORMAT()         //Optional. Use with the FIND clause to apply localizaed formatting to standard and custom number, date
    //time, and currency fields
[IN SearchGroup]  //Optional. Scope of fields to search. One of the following values:
                  //ALL FIELDS
                  //NAME FIELDS
                  //EMAIL FIELDS
                  //PHONE FIELDS
                  //SIDEBAR FIELDS
[RETURNING FieldSpec[ [toLabel(fields)] [convertCurrency(***Amount***)] [FORMAT()] ]] //Optional

[WITH DivisionFilter]
[WITH DATA CATEGORY DataCategorySpec]
[WITH SNIPPET[(target_length=n)]]
[WITH NETWORK NetworkIdSpec]
[WITH PricebookId]
[WITH METADATA]
[LIMIT n] //Optional. Specifies the maximum number of rows to return int he text query, up to 2k
//[OFFSET n] //Optional. When expecting many records in a query's results, you can display the results in multiple pages