using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Server.Data;
// using Server.Mapping;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddDbContext<InsuranceDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"),
    sql => sql.EnableRetryOnFailure()) // Retry on failure. Database may be waking up.
);

// builder.Services.AddAutoMapper(typeof(MappingProfile));

builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseWebAssemblyDebugging();
}
else
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

// app.UseHttpsRedirection();

app.UseBlazorFrameworkFiles();
app.UseStaticFiles();

app.UseRouting();

app.MapRazorPages();
app.MapControllers();
app.MapFallbackToFile("index.html");


// Health check endpoint
app.MapGet("/health", () => Results.Ok("Healthy"));

// Database healthcheck endpoint
app.MapGet("/health/db", async (InsuranceDbContext db) =>
{
    try
    {
        await db.Claims.ToListAsync();
        return Results.Ok("Database is healthy");
    }
    catch (Exception)
    {
        return Results.StatusCode(500);
    }
});

app.Run();
