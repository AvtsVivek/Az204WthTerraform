function validateItem()
{
    var context = getContext();
    var request = context.getRequest();
    var item=request.getBody();

    // Let's check if the property has the quantity
    // If not , we will set it to 0

    if(!("quantity" in item))
    {
        item["quantity"]=0;
    }

    request.setBody(item);
}