using Insurance.Shared.DTOs;
using System.Net.Http.Json;

public class PolicyService
{
    private readonly HttpClient _http;

    public PolicyService(HttpClient http)
    {
        _http = http;
    }

    // public async Task<List<GetClaimsDto>> GetAllClaims()
    //     => await _http.GetFromJsonAsync<List<GetClaimsDto>>("api/claims");

    // public async Task<GetClaimsDto> GetClaim(int id)
    //     => await _http.GetFromJsonAsync<GetClaimsDto>($"api/claims/{id}");

}
