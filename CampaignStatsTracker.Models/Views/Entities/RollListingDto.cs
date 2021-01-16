namespace CampaignStatsTracker.Models.Views.Entities
{
    public class RollListingDto : Entity
    {
        public int Value { get; set; }
        public int Modifier { get; set; }
        public string RollType { get; set; }
    }
}