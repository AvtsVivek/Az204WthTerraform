    function HelloWorld(){
        var context = getContext();        
        var response = context.getResponse();

        response.setBody("Hello World, this from the stored procedure HelloWorld");
    }
