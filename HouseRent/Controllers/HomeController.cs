using Houses.BLL;
using Houses.Model;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HouseRent.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        private UserManager m_user=null;
        private HouseManager m_house = null;
        public HomeController() {
            m_user = new UserManager();
            m_house = new HouseManager();
        }

        public ActionResult Index()
        {

            return View();
        }

        public JsonResult GetChartData() {
            List<Object> barData = m_user.GetBarData();
            List<Object> publishData = m_house.GetPublishData();
            string barStr = Newtonsoft.Json.JsonConvert.SerializeObject(barData);
            string publishStr = Newtonsoft.Json.JsonConvert.SerializeObject(publishData);
            return Json(new { barData = barData, publishData = publishData }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetPageList() {
            var houseData = new HouseManager().GetAll();
            var pageList = new PagedList<House>(houseData, 1, 10);
            IsoDateTimeConverter timeFormat = new IsoDateTimeConverter();
            timeFormat.DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
            string sResult = Newtonsoft.Json.JsonConvert.SerializeObject(pageList, timeFormat);
            return Json(new { data = sResult }, JsonRequestBehavior.AllowGet);
        }
    }
}
