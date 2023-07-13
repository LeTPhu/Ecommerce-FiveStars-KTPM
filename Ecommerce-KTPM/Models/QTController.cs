using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ecommerce_KTPM.Models
{
    public class QTController : Controller
    {
		// GET: QTV
		protected override void OnActionExecuted(ActionExecutedContext filterContext)
		{
			TaiKhoanTV t = Session["DangNhap"] as TaiKhoanTV;
			if (t.TKTV == null || (t.TKTV != "admin" && t.ghiChu != "QTV"))
			{
				t = new TaiKhoanTV();
				Session["DangNhap"] = t;
				string tb = "Vui lòng đăng nhập!";
				TempData["TBDangNhap"] = tb;
				Response.Redirect(Url.Action("Login", "SignIn", new { area = "" }), true);
			}
		}
	}
}