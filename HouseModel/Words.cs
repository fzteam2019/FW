using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Houses.Model
{
    [Serializable]
    public partial class Words
    {
        public Words() { }

        private Guid _id;

        private string _name;

        private string _theme;

        private string _content;

        private DateTime _publishTime;

        private int _userId;

        private int _houseId;


        public Guid Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public string Theme
        {
            get { return _theme; }
            set { _theme = value; }
        }

        public string Content
        {
            get { return _content; }
            set { _content = value; }
        }

        public DateTime PublishTime
        {
            get { return _publishTime; }
            set { _publishTime = value; }
        }

        public int UserId
        {
            get { return _userId; }
            set { _userId = value; }
        }

        public int HouseId
        {
            get { return _houseId; }
            set { _houseId = value; }
        }
    }
}
