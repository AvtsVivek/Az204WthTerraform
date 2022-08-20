var builder = WebApplication.CreateBuilder(args);
//Retrieve the Connection String from the secrets manager 
// var connectionString = builder.Configuration.GetConnectionString("AppConfig");

// We are hard coding, instead of using the secrets and so on.
var connectionString = "Endpoint=https://hr-dev-rg-vivrag-new-app-conf-fhhepf.azconfig.io;Id=WVzk-l0-s0:OtEF4HEn5i9zjIWwgNtp;Secret=tiGYfQtETGrueqoMrH56WfmY7Kds/6mG4o8R3zOG/pc=";

builder.Host.ConfigureAppConfiguration(builder =>
    {
        //Connect to your App Config Store using the connection string
        builder.AddAzureAppConfiguration(connectionString);
    })
    .ConfigureServices(services =>
    {
        services.AddControllersWithViews();
    });

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
