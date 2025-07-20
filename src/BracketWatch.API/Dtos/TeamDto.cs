namespace BracketWatch.API.Dtos
{
    public class TeamDto
    {
        public int Id { get; set; }
        public string Name { get; set; } = "NAME_ERROR";
        public string Description { get; set; } = "";
        public int Wins { get; set; }
        public int Losses { get; set; }
        public int PointsFor {  get; set; }
        public int PointsAgainst { get; set; }
        public int GamesPlayed { get; set; }
        public decimal StrengthOfSchedule { get; set; }
        public decimal Rating { get; set; }
        public TeamDto() { }
    }
}
