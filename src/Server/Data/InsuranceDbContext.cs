using Microsoft.EntityFrameworkCore;
using Insurance.Shared.DTOs;
using Insurance.Shared.Models;

namespace Server.Data;

public class InsuranceDbContext : DbContext
{
    public InsuranceDbContext(DbContextOptions<InsuranceDbContext> options) : base(options)
    {
    }
    public DbSet<CustomerClaim> Claims { get; set; }
    // public DbSet<PostClaimDto> PostClaims { get; set; }
}