using Houses.DAL;
using Houses.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Houses.BLL
{
    public partial class CommentManager
    {
        private readonly CommentService dal = new CommentService();

        public CommentManager() { }

        /// <summary>
        /// 新增评论
        /// </summary>
        /// <param name="comment"></param>
        /// <returns></returns>
        public int Add(Comment comment)
        {
            return dal.Add(comment);
        }

        /// <summary>
        /// 获取特定房屋的所有评论 
        /// </summary>
        /// <param name="houseId"></param>
        /// <returns></returns>

        public List<Comment> GetAllCommentByHouseId(int houseId)
        {
            return dal.GetAllCommentsByHouseId(houseId);
        }
    }
}
