using System;
using System.Collections.Generic;

namespace CampaignStatsTracker.Models.Views.Entities
{
    public abstract class Entity
    {
        public Guid PublicId { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
