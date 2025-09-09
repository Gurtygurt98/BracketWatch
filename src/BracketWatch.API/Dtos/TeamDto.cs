namespace BracketWatch.API.Dtos
{
    public class TeamDto
    {
        public int id { get; set; } = -1;
        public string name { get; set; } = "NAME_ERROR";
        public string description { get; set; } = "";
        public int wins { get; set; }
        public int Losses { get; set; }
        public int pointsFor {  get; set; }
        public int pointsAgainst { get; set; }
        public int gamesPlayed { get; set; }
        public decimal strengthOfSchedule { get; set; }
        public decimal rating { get; set; }
        public TeamDto() { }
    }
}
