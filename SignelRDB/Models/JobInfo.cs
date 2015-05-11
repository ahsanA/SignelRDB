using System;

namespace SignelRDB.Models
{
    public class JobInfo
    {
        public int JobID { get; set; }
        public string Name { get; set; }
        public DateTime LastExecutionDate { get; set; }
        public string Status { get; set; }
    }
}