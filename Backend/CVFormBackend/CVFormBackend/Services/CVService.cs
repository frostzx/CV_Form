using CVFormBackend.Models;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Text.Json;

namespace CVFormBackend.Services
{
    public class CVService
    {
        private readonly string _connectionString;

        public CVService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<int> InsertCompleteCVAsync(CompleteCVModel cvModel)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var command = new SqlCommand("InsertCompleteCV", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Serialisasi objek ke format JSON
                    var employmentHistoryJson = JsonSerializer.Serialize(cvModel.EmploymentHistory);
                    var educationJson = JsonSerializer.Serialize(cvModel.Education);
                    var skillsJson = JsonSerializer.Serialize(cvModel.Skills);

                    // Menambahkan parameter untuk stored procedure
                    command.Parameters.AddWithValue("@WantedJobTitle", cvModel.PersonalDetails.WantedJobTitle);
                    command.Parameters.AddWithValue("@Photo", cvModel.PersonalDetails.Photo);
                    command.Parameters.AddWithValue("@FirstName", cvModel.PersonalDetails.FirstName);
                    command.Parameters.AddWithValue("@LastName", cvModel.PersonalDetails.LastName);
                    command.Parameters.AddWithValue("@Email", cvModel.PersonalDetails.Email);
                    command.Parameters.AddWithValue("@Phone", cvModel.PersonalDetails.Phone);
                    command.Parameters.AddWithValue("@Country", cvModel.PersonalDetails.Country);
                    command.Parameters.AddWithValue("@City", cvModel.PersonalDetails.City);
                    command.Parameters.AddWithValue("@Address", cvModel.PersonalDetails.Address);
                    command.Parameters.AddWithValue("@PostalCode", cvModel.PersonalDetails.PostalCode);
                    command.Parameters.AddWithValue("@DrivingLicense", cvModel.PersonalDetails.DrivingLicense);
                    command.Parameters.AddWithValue("@Nationality", cvModel.PersonalDetails.Nationality);
                    command.Parameters.AddWithValue("@PlaceOfBirth", cvModel.PersonalDetails.PlaceOfBirth);
                    command.Parameters.AddWithValue("@DateOfBirth", cvModel.PersonalDetails.DateOfBirth);
                    command.Parameters.AddWithValue("@ProfessionalSummary", cvModel.PersonalDetails.ProfessionalSummary);

                    // Menambahkan parameter JSON untuk EmploymentHistory, Education, dan Skills
                    command.Parameters.AddWithValue("@EmploymentHistory", employmentHistoryJson);
                    command.Parameters.AddWithValue("@Education", educationJson);
                    command.Parameters.AddWithValue("@Skills", skillsJson);

                    // Ambil nilai dari query SELECT
                    var userId = (int)(await command.ExecuteScalarAsync());
                    return userId;
                }
            }
        }
    }
}
