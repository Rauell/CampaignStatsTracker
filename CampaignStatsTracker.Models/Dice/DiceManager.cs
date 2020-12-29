namespace CampaignStatsTracker.Models.Dice
{
    public static class DiceManager
    {
        public static Die Die(int max) => new Die(max);
        public static Die D4 => Die(4);
        public static Die D6 => Die(6);
        public static Die D8 => Die(8);
        public static Die D10 => Die(8);
        public static Die D12 => Die(10);
        public static Die D20 => Die(20);
        public static Die D100 => Die(100);
    }
}
