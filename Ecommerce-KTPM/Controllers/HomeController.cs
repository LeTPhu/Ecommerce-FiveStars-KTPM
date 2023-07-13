using Ecommerce_KTPM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ecommerce_KTPM.Controllers
{
	public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Home()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
		[HttpPost]
		public ActionResult GuiHoTro(string name, string email, string chude, string noidung)
		{
            try
            {
				SendEmail.SendEmailHoTro(name, email, chude, noidung);
				SendEmail.SendEmailHoTroQT(name, email, chude, noidung);
				return View("Home");

			}
			catch (Exception ex)
            {
                ViewBag.usc = "Đã xảy ra lỗi trong quá trình gửi Email. Vui lòng gửi lại sau";
				return View("Contact");

			}
            ViewBag.usc = "Đã xảy ra lỗi trong quá trình gửi Email. Vui lòng gửi lại sau";
			return View("Contact");
		}


	}
}