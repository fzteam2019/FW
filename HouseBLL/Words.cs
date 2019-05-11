using Houses.DAL;
using Houses.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Houses.BLL
{


    public class WordsManager
    {
        private readonly WordsService dal = new WordsService();

        public WordsManager() { }

        public List<Words> GetAllWordsByHouseId(int houseId)
        {
            return dal.GetAllWordsByHouseId(houseId);
        }

        public int Add(Words words)
        {
            return dal.Add(words);
        }
    }
}
