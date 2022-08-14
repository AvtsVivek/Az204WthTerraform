// var contentRootPath = System.Reflection.Assembly.GetEntryAssembly()!.Location;

// contentRootPath = contentRootPath.Substring(0, contentRootPath.LastIndexOf(@"\") + 1);

// var webApplicationOptions = new WebApplicationOptions{
//     Args = args,
//     // ApplicationName = "Simple Web App",
//     ContentRootPath = contentRootPath,
//     // WebRootPath = "",
//     // EnvironmentName = ""
// };

// var builder = WebApplication.CreateBuilder(webApplicationOptions);

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
