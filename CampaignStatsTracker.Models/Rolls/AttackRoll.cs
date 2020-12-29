namespace CampaignStatsTracker.Models.Rolls
{
    public class AttackRoll: Roll
    {
        public Roll Damage { get; set; }
        public string Comment { get; set; }
        public bool Succeeded { get; set; }
        public string Target { get; set; }
        public string Type { get; set; }
    }
}
