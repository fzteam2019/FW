using Houses.BLL;
using Houses.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HouseRent.Areas.Admin.Controllers
{
    public class WordsController : Controller
    {
        //
        // GET: /Admin/Words/

        const int pageSize = 5;
        public ActionResult Index(int userId,int pageIndex=1)
        {
            var wordsData = new WordsManager().GetAllUserWords(userId);
            var pageList = new PagedList<Words>(wordsData == null ? new List<Words>():wordsData  , pageIndex, pageSize);
            return View(pageList);
        }

    }
}
