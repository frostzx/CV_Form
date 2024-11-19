using CVFormBackend.Models;
using CVFormBackend.Services;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CVFormBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("AllowAll")]
    public class CVController : ControllerBase
    {
        private readonly CVService _cvService;

        // Injecting UserService to handle business logic
        public CVController(CVService cvService)
        {
            _cvService = cvService;
        }

        [HttpPost("InsertCompleteCV")]
        public async Task<IActionResult> InsertCompleteCV([FromBody] CompleteCVModel cvModel)
        {
            if (cvModel == null)
            {
                return BadRequest("CV data is required.");
            }

            try
            {
                int userId = await _cvService.InsertCompleteCVAsync(cvModel);

                return Ok(new { UserID = userId, message = "Berhasil Save Data" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}
