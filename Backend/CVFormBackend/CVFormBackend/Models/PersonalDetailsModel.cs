namespace CVFormBackend.Models
{
    public class PersonalDetailsModel
    {
        public int UserID { get; set; }
        public string WantedJobTitle { get; set; }
        public string Photo { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string PostalCode { get; set; }
        public string DrivingLicense { get; set; }
        public string Nationality { get; set; }
        public string PlaceOfBirth { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string ProfessionalSummary { get; set; }
    }
}
