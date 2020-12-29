using System;

namespace CampaignStatsTracker.Models.Dice
{
    public class Die
    {
        private readonly static Random _random = new Random();
        public int Max { get; }
        public int Value { get; set; }

        public int Roll() => _random.Next(1, Max);

        public int RollAndSet()
        {
            Value = Roll();
            return Value;
        }

        public Die(int max)
        {
            Max = max;
        }
    }
}
