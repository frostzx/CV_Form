namespace CVFormBackend.Models
{
    public class EducationModel
    {
        public int EducationID { get; set; }
        public int UserID { get; set; }
        public string School { get; set; }
        public string Degree { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string City { get; set; }
        public string Description { get; set; }
    }
}
