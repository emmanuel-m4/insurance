using Microsoft.AspNetCore.Mvc;
using Server.Data;
using Microsoft.EntityFrameworkCore;
using Insurance.Shared.DTOs;
using Insurance.Shared.Models;
// using AutoMapper;

namespace Server.Controllers;

[ApiController]
[Route("/claims")]
public class ClaimsController : ControllerBase
{
    private readonly InsuranceDbContext _context;
    // private readonly IMapper _mapper;

    public ClaimsController(InsuranceDbContext context)
    {
        _context = context;
        // _mapper = mapper;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<CustomerClaim>>> GetClaims()
    {
        var claims = await _context.Claims.ToListAsync();
        // var claimsDto = _mapper.Map<List<GetClaimsDto>>(claims);
        return Ok(claims);
    }
}
