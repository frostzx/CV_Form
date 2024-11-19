namespace CVFormBackend.Models
{
    public class CompleteCVModel
    {
        public PersonalDetailsModel PersonalDetails { get; set; }
        public List<EmploymentHistoryModel> EmploymentHistory { get; set; }
        public List<EducationModel> Education { get; set; }
        public List<SkillModel> Skills { get; set; }
    }
}
