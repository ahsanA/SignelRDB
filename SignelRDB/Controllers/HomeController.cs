using System.Collections.Generic;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using SignelRDB.Models;
using SignelRDB.Repository;

namespace SignelRDB.Controllers
{
    public class HomeController : Controller
    {
        JobInfoRepository objRepo = new JobInfoRepository();

        public ActionResult Index()
        {
            return View();
        }

        // GET api/values
        public JsonResult Get()
        {
            var data = objRepo.GetData();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}
