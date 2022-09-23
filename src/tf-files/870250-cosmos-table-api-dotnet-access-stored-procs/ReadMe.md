
# Accessing SPs, Triggers etc.

- Note the files HelloWorld.js, CreateItems.js, and ValidateItem.js

- HelloWorld.js is a sp which returns a string when called.

- CreateItems, adds new items.

- ValidateItem.js contains a trigger. See 3Trigger1.jpg. Essentially, this ensures that the quantitiy is set to a default value(in this case to 0) when a new item is added.

  - see [the method in the dotnet app here](https://github.com/AvtsVivek/Az204WthTerraform/blob/main/src/dotnet-apps/0200-CosmosStoredProcs/CosmosStoredProcs/Program.cs). async Task CreateItem()
  - This method adds a item, but it does not set quantity.
```cs
dynamic orderItem =
    new
    {
        id = Guid.NewGuid().ToString(),
        orderId = "O5",
        category = "Laptop"
    };
```

  - So the trigger is executed(for every item created) and ensure the quantity is set to 0.





