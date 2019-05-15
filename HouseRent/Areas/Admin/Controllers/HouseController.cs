using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Houses.BLL;
using Houses.Model;
using System.Text;
using System.IO;

namespace HouseRent.Areas.Admin.Controllers
{
    public class HouseController : Controller
    {
        //
        // GET: /Admin/House/
        const int pageSize = 5;
        public ActionResult Index(int userId,int pageIndex=1)
        {
            var houseData = new HouseManager().GetAllByUserId(userId);
            var pageList = new PagedList<House>(houseData == null ? new List<House>() : houseData, pageIndex, pageSize);
            return View(pageList);
        }

       
        public ActionResult Edit(int id=-1)
        {
            if (id > 0)
            {
                var house = new HouseManager().GetHouse(id);
                var streets = new StreetManager().GetList(house.Street.District.Id);
                var list = new SelectList(streets, "Id", "Name");
                ViewBag.Streets = list;
                return View(house);
            }
            return View();
        }

        //删除
        public ActionResult Delete(int id)
        {
            string msg = new HouseManager().Delete(id) ? "删除成功！" : "删除失败！";
            return Content("<script>alert('" + msg + "');location.href='/Admin';</script>");
        }

        // Ajax获取级联菜单街道数据
        public JsonResult GetStreet(int id)
        {
            var data = new StreetManager().GetList(id);
            return Json(data,JsonRequestBehavior.AllowGet);
        }

        // 新增 or 修改
        [HttpPost]
        public ActionResult Edit(House house)
        {
            if (ModelState.IsValid)
            {
                int id = house.HouseId ?? -1;
                bool ret = false;
                var manager=new HouseManager();
                if (id > 0)
                {
                    ret = manager.Update(house);
                }
                else
                {
                    house.PublishUserId = (Session["admin"] as User).LoginId;
                    ret = manager.Add(house);
                }
                string msg = ret ? "编辑成功！" : "编辑失败！";
                return Content("<script>alert('" + msg + "');location.href='/Admin?userId=" + (Session["admin"] as User).LoginId + "';</script>");
            }

            return View(house);
        }

        [HttpPost]
        public ActionResult Upload()
        {
            StringBuilder info = new StringBuilder();
            String baseDir = Server.MapPath("~/Images/Images_House");
            for (int i =0;i<Request.Files.Count;i++)
            {
                HttpPostedFileBase postFile = Request.Files[i];//get post file 
                if (postFile.ContentLength == 0)
                    continue;
                if (!Directory.Exists(baseDir))
                    Directory.CreateDirectory(baseDir);
                string extension = Path.GetExtension(postFile.FileName);
                string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(postFile.FileName);
                string newFileName = Guid.NewGuid().ToString() + extension;
                var savePath = Path.Combine(baseDir, newFileName);
                postFile.SaveAs(savePath);
                string showPath = "Images/Images_House/" + newFileName;
                info.Append(showPath + ";");
            }
            return Content(info.ToString());
        }

        //[HttpPost]
        //public ActionResult Upload11()
        //{
        //    if (Request.Files.Count>0)
        //    {
        //        string extension = string.Empty;
        //        HttpPostedFileBase file = Request.Files[0] as HttpPostedFileBase;
                
        //        if (file.FileName.Length > 0)
        //        {
        //            if (file.FileName.IndexOf('.') > -1)
        //            {
        //                //创建路径
        //                string baseDir = Server.MapPath("~" + "Images/Images_House/");
        //                if (!Directory.Exists(baseDir))
        //                    Directory.CreateDirectory(baseDir);
        //                if (file.FileName.ToString() != "")
        //                {
        //                    var pathLast = Path.Combine(baseDir, file.FileName);
        //                    file.SaveAs(pathLast);
        //                }
        //            }
        //        }
        //    }
        //    return Content("success");
        //}


        public ActionResult WordsList(int userId)
        {

            
            return View();
        }

    }
}
