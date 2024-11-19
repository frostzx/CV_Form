namespace CVFormBackend.Models
{
    public class EmploymentHistoryModel
    {
        public int EmploymentID { get; set; }
        public int UserID { get; set; }
        public string JobTitle { get; set; }
        public string Employer { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string City { get; set; }
        public string Description { get; set; }
    }
}
