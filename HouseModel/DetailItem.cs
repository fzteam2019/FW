using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Houses.Model
{
    [Serializable]
    public partial class DetailItem
    {
        public House HouseInfo;

        public List<Words> Words;

        public List<Comment> Comments;
    }
}
