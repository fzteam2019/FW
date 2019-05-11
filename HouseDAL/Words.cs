using Houses.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Houses.DAL
{
    public class WordsService
    {
        public WordsService() { }

        /// <summary>
        /// 新增一条留言
        /// </summary>
        /// <returns></returns>
        public int Add(Words words)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into [Words](");
            strSql.Append("Id,Name,Theme,Content,PublishTime,UserId,HouseId)");
            strSql.Append(" values (");
            strSql.Append("@Id,@Name,@Theme,@Content,@PublishTime,@UserId,@HouseId)");
            strSql.Append("SELECT @@ROWCOUNT");
            //strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
                new SqlParameter("@Id",SqlDbType.UniqueIdentifier),
                new SqlParameter("@Name",SqlDbType.NVarChar,20),
                new SqlParameter("@Theme",SqlDbType.NVarChar,50),
                new SqlParameter("@Content",SqlDbType.Text),
                new SqlParameter("@PublishTime",SqlDbType.DateTime),
                new SqlParameter("@UserId",SqlDbType.Int),
                new SqlParameter("@HouseId",SqlDbType.Int)
            };
            parameters[0].Value = words.Id;
            parameters[1].Value = words.Name;
            parameters[2].Value = words.Theme;
            parameters[3].Value = words.Content;
            parameters[4].Value = words.PublishTime;
            parameters[5].Value = words.UserId;
            parameters[6].Value = words.HouseId;

            object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnectionString, CommandType.Text, strSql.ToString(), parameters);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }

        /// <summary>
        /// 获取用户的求租留言
        /// </summary>
        /// <param name="houseId"></param>
        /// <returns></returns>
        public List<Words> GetAllWordsByHouseId(int houseId)
        {
            List<Words> result = null;
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * from Words");
            strSql.Append(" where HouseId = @HouseId");
            SqlParameter[] parameters = {
                new SqlParameter("@HouseId",SqlDbType.Int)
            };
            parameters[0].Value = houseId;

            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString, CommandType.Text, strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                result = new List<Words>();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    Words words = new Words();
                    words.Id =new Guid(dr["Id"].ToString());
                    words.Name = dr["Name"].ToString();
                    words.Theme = dr["Theme"].ToString();
                    words.Content = dr["Content"].ToString();
                    words.PublishTime = Convert.ToDateTime(dr["PublishTime"].ToString());
                    words.UserId = int.Parse(dr["UserId"].ToString());
                    words.HouseId = int.Parse(dr["HouseId"].ToString());
                    result.Add(words);
                }
            }
            return result;
        }


    }
}
