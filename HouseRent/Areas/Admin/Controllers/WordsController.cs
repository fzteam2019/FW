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


        public ActionResult Edit(string wordId,string reply)
        {
            var manager = new WordsManager();
            int ret = manager.UpdateReply(wordId, reply);

            string msg = ret == 1 ? "编辑成功！" : "编辑失败！";
            return Content(msg);
            //return Content("<script>alert('" + msg + "');location.href='/Admin?userId=" + (Session["admin"] as User).LoginId + "';</script>");
        }

        public ActionResult GetWord(string wordId)
        {
            var manager = new WordsManager();
            Words word =  manager.GetWord(wordId);
            string result = word == null ? "" : word.Answer;
            return Content(result);
        }
    }
}
