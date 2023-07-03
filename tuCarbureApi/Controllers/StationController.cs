using Microsoft.AspNetCore.Mvc;
using tuCarbureApi.EntityLayer;

namespace tuCarbureApi.Controllers;

[ApiController]
[Route("[controller]")]
public class Controller : ControllerBase
{

    [HttpGet]
    public ActionResult<List<Station>> Get(){
       return StatusCode(StatusCodes.Status200OK);
    }
}
