using Insurance.Shared.Enums;
using Microsoft.EntityFrameworkCore;

namespace Insurance.Shared.DTOs;

public class GetClaimsDto
{
    public Guid Id { get; set; }
    public string PolicyNumber { get; set; } = string.Empty;
    public string Type { get; set; } = string.Empty;
    [Precision(18, 2)]
    public decimal Amount { get; set; }
    public DateTime DateOfClaim { get; set; }
    public DateTime? DateOfLoss { get; set; } // Allow null for health-related claims
    public string Description { get; set; } = string.Empty;
    public ClaimStatus Status { get; set; }
}
