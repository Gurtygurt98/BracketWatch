using BracketWatch.API.Dtos;
using BracketWatch.API.Dtos.PowerRankings;
using Microsoft.AspNetCore.Mvc;

namespace BracketWatch.API.Controllers
{
    [Route("api/power_rankings")]
    [ApiController]
    public class PowerRankingsController :ControllerBase
    {
        private readonly ILogger<PowerRankingsController> _logger;

        public PowerRankingsController(ILogger<PowerRankingsController> logger) 
        {
            _logger = logger;
        }
        [HttpGet]
        [Route("Get")]
        [ProducesResponseType(typeof(IEnumerable<PowerRankingDto>), StatusCodes.Status200OK)]
        public async Task<IActionResult> GetPowerRankings()
        {
            List<PowerRankingDto> currentPowerRankingList = new();
            PowerRankingDto testTeam1 = new PowerRankingDto
            {
                team = new TeamDto
                {
                    Id = 1,
                    Name = "Chiefs"
                },
                rank = 1
            };
            PowerRankingDto testTeam2 = new PowerRankingDto
            {
                team = new TeamDto
                {
                    Id = 2,
                    Name = "Steelers"
                },
                rank = 2
            };
            currentPowerRankingList.Add(testTeam2);
            currentPowerRankingList.Add(testTeam1);
            return Ok(currentPowerRankingList);
        }

    }
}
