
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using SignelRDB.Models;

namespace SignelRDB.Repository
{
    public class JobInfoRepository
    {
        public IEnumerable<JobInfo> GetData()
        {

            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(@"SELECT [JobID],[Name],[LastExecutionDate],[Status]
               FROM [dbo].[JobInfo]", connection))
                {
                    // Make sure the command object does not already have
                    // a notification object associated with it.
                    command.Notification = null;

                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(dependency_OnChange);

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    using (var reader = command.ExecuteReader())
                        return reader.Cast<IDataRecord>()
                            .Select(x => new JobInfo()
                            {
                                JobID = x.GetInt32(0),
                                Name = x.GetString(1),
                                LastExecutionDate = x.GetDateTime(2),
                                Status = x.GetString(3)
                            }).ToList();



                }
            }
        }
        private void dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
            JobHub.Show();
        }
    }
}