function createItems(items) {
    var context = getContext();        
    var response = context.getResponse();
    
    if(!items) 
    {         
            response.setBody("Error: Items are undefined");    
            return;
    }
    
    var numOfItems=items.length;
    checkLength(numOfItems);

    for(let i=0;i<numOfItems;i++)
    {
        createItem(items[i]);
    }
    
    response.setBody("Items added to collection");    
            

    function checkLength(itemLength)
    {
         if(itemLength==0)    
         {
            response.setBody("Error: There are no items to add");    
            return;
         }
    }       

    function createItem(item)
    {
        var collection = getContext().getCollection();
        var collectionLink = collection.getSelfLink();
        collection.createDocument(collectionLink,item); 
    }
   
}