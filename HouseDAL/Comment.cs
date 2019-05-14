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
    public partial class CommentService
    {
        /// <summary>
        /// 构造函数
        /// </summary>
        public CommentService()
        {

        }

        /// <summary>
        /// 新增评论
        /// </summary>
        /// <param name="comment"></param>
        /// <returns></returns>
        public int Add(Comment comment)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into [Comment](");
            strSql.Append("Id,UserId,HouseId,Content,Score,CommentTime)");
            strSql.Append(" values (");
            strSql.Append("@Id,@UserId,@HouseId,@Content,@Score,@CommentTime)");
            strSql.Append("SELECT @@ROWCOUNT");
            SqlParameter[] parameters = {
                new SqlParameter("@Id",SqlDbType.UniqueIdentifier),
                new SqlParameter("@UserId",SqlDbType.Int),
                new SqlParameter("@HouseId",SqlDbType.Int),
                new SqlParameter("@Content",SqlDbType.NVarChar,500),
                new SqlParameter("@Score",SqlDbType.Int),
                new SqlParameter("@CommentTime",SqlDbType.DateTime)
            };
            parameters[0].Value = comment.Id;
            parameters[1].Value = comment.UserId;
            parameters[2].Value = comment.HouseId;
            parameters[3].Value = comment.Content;
            parameters[4].Value = comment.Score;
            parameters[5].Value = comment.CommentTime;

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
        /// 获取特定房屋的所有评论
        /// </summary>
        /// <param name="houseId"></param>
        /// <returns></returns>
        public List<Comment> GetAllCommentsByHouseId(int houseId)
        {
            List<Comment> result = null;

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * from Comment");
            strSql.Append(" where HouseId = @HouseId");
            SqlParameter[] parameters = {
                new SqlParameter("@HouseId",SqlDbType.Int)
            };
            parameters[0].Value = houseId;

            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString, CommandType.Text, strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                result = new List<Comment>();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    Comment comment = new Comment();
                    comment.Id = new Guid(dr["Id"].ToString());
                    comment.UserId = int.Parse(dr["UserId"].ToString());
                    comment.HouseId = int.Parse(dr["Theme"].ToString());
                    comment.Content = dr["Content"].ToString();
                    comment.CommentTime = Convert.ToDateTime(dr["PublishTime"].ToString());
                    comment.Score = int.Parse(dr["Score"].ToString());
                    result.Add(comment);
                }
            }

            return result;
        }
    }
}
