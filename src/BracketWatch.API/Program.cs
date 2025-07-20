var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseHttpsRedirection();

// serve Swagger JSON and UI
app.UseSwagger();
app.UseSwaggerUI(c =>
{
    c.SwaggerEndpoint("/swagger/v1/swagger.json", "BracketWatch v1");
    // c.RoutePrefix = "";  // uncomment to serve UI at root (/)
});

app.MapControllers();

app.Run();
