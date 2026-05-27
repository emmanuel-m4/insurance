using Microsoft.EntityFrameworkCore;
using Server.Controllers;
using Insurance.Shared.Models;
using Insurance.Shared.Enums;
using Server.Data;
using Microsoft.AspNetCore.Mvc;
using Insurance.Shared.DTOs;
namespace Test;

public class UnitTest1
{
    private InsuranceDbContext GetDbContext()
    {
        var options = new DbContextOptionsBuilder<InsuranceDbContext>()
            .UseInMemoryDatabase("TestDb")
            .Options;
        return new InsuranceDbContext(options);
    }

    [Fact]
    public async Task GetClaims_ReturnsAllClaims()
    {
        // Arrange
        var context = GetDbContext();
        // context.Database.EnsureDeleted();
        context.Database.EnsureCreated();
        context.Claims.Add(new CustomerClaim { PolicyNumber = "POL-23423", ClaimType = "Health", Amount = 200.00m, Description = "Test", Status = ClaimStatus.Approved });
        context.Claims.Add(new CustomerClaim { PolicyNumber = "POL-90734", ClaimType = "Auto", Amount = 200.00m, Description = "Test Auto", Status = ClaimStatus.Denied });
        await context.SaveChangesAsync();

        var controller = new ClaimsController(context);

        // Act
        var result = await controller.GetClaims();

        var okResult = Assert.IsType<OkObjectResult>(result.Result);
        var claims = Assert.IsAssignableFrom<IEnumerable<CustomerClaim>>(okResult.Value);

        Assert.Equal(2, claims.Count());
    }
}
