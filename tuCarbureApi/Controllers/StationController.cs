using Microsoft.AspNetCore.Mvc;
using tuCarbureApi.EntityLayer;
using tuCarbureApi.Models;
using tuCarbureApi.Services;

namespace tuCarbureApi.Controllers;

[ApiController]
[Route("[controller]")]
public class StationController : ControllerBase
{
    private readonly MongoDBService _mongoDBService;

    public StationController(MongoDBService mongoDBService){
        _mongoDBService = mongoDBService;
    }

    [HttpGet]
    public async Task<ActionResult<List<Station>>> Get(){
       return await _mongoDBService.GetAsync();
    }

    [HttpGet]
    [Route("/Station/{id}")]
    public async Task<ActionResult<List<Station>>> Get(string id){
        return await _mongoDBService.GetByIdAsync(id);
    }

    [HttpPost]
    public async Task<ActionResult<Station>> Post([FromBody] Station station){
        await _mongoDBService.CreateAsync(station);
        return CreatedAtAction(nameof(Get), new { id = station.StationId }, station);
    }

    [HttpPatch]
    public async Task<ActionResult<Station>> Patch(string id, string nomCarburant, int prix){
        await _mongoDBService.PatchAsync(id, nomCarburant, prix);
        return;
    }
}
