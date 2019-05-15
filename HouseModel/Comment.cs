using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Houses.Model
{
    public partial class Comment
    {
        private Guid _id;

        private int _userid;

        private int _houseid;

        private string _content;

        private int _score;

        private DateTime _commentTime;

        /// <summary>
        /// 主键
        /// </summary>
        public Guid Id
        {
            get { return _id; }
            set { _id = value; }
        }

        /// <summary>
        /// 用户Id
        /// </summary>
        public int UserId
        {
            get { return _userid; }
            set { _userid = value; }
        }

        /// <summary>
        /// 房屋Id
        /// </summary>
        public int HouseId
        {
            get { return _houseid; }
            set { _houseid = value; }
        }

        /// <summary>
        /// 评价内容
        /// </summary>
        public string Content
        {
            get { return _content; }
            set { _content = value; }
        }

        /// <summary>
        /// 评价分数
        /// </summary>
        public int Score
        {
            get { return _score; }
            set { _score = value; }
        }

        /// <summary>
        /// 评论时间
        /// </summary>
        public DateTime CommentTime
        {
            get { return _commentTime; }
            set { _commentTime = value; }
        }
    }
}
