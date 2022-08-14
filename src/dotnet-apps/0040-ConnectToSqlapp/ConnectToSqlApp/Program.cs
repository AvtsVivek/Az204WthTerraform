
var contentRootPath = System.Reflection.Assembly.GetEntryAssembly()!.Location;

contentRootPath = contentRootPath.Substring(0, contentRootPath.LastIndexOf(@"\") + 1);

var webApplicationOptions = new WebApplicationOptions{
    Args = args,
    // ApplicationName = "Simple Web App",
    ContentRootPath = contentRootPath,
    // WebRootPath = "",
    // EnvironmentName = ""
};

var builder = WebApplication.CreateBuilder(webApplicationOptions);

// var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
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
