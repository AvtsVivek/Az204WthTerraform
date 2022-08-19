using sqlapp.Services;

var builder = WebApplication.CreateBuilder(args);

// var connectionString = "Endpoint=https://appconfig1000233.azconfig.io;Id=E0j2-l8-s0:ywglWz9a/tngma/7q5/S;Secret=QA16TLCFkzE7j+BmvBnm/zlC2VJ/X4HqViAuA/PMHeQ=";

var connectionString = "Endpoint=https://hr-dev-rg-vivrag-new-app-conf-pwzxts.azconfig.io;Id=JUsw-l0-s0:uWGOMlj9CakbO6JZ7iwD;Secret=NrBgKrBnnFXikUFk2RKhZo9Kh3sz8bS8DikzMJ0yaY0=";

builder.Host.ConfigureAppConfiguration(builder =>
{
    //Connect to your App Config Store using the connection string
    builder.AddAzureAppConfiguration(connectionString);
});

builder.Services.AddTransient<IProductService, ProductService>();

builder.Services.AddRazorPages();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
