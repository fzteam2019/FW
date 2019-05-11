using Houses.BLL;
using Houses.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HouseRent.Areas.Front.Controllers
{
    public class HouseController : Controller
    {
        //
        // GET: /Front/House/
        const int pageSize = 5;
        public ActionResult Index(int pageIndex=1)
        {
            var houseData = new HouseManager().GetAll();
            var pageList = new PagedList<House>(houseData, pageIndex, pageSize);
            return View(pageList);
        }


        public ActionResult Detail(int houseId)
        {
            House houseInfo = new HouseManager().GetHouse(houseId);
            List<Words> words = new WordsManager().GetAllWordsByHouseId(houseId);

            var result =  new DetailItem{
                    HouseInfo = houseInfo,
                    Words = words
                };
            
            return View(result);
            //return Json(result, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 新增求租留言
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult AddWords(string content,int userid,int houseid)
        {
            Words words = new Words(){
                Id = Guid.NewGuid(),
                Name = "",
                Theme = "",
                Content = content,
                PublishTime = DateTime.Now,
                UserId = userid,
                HouseId = houseid
            };
            int result = new WordsManager().Add(words);
            return Content(result.ToString());
        }

    }
}
