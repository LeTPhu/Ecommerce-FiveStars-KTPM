using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ecommerce_KTPM.Models
{
    public class BaoMatController : Controller
    {
		// GET: BaoMat
		protected override void OnActionExecuted(ActionExecutedContext filterContext)
		{
			TaiKhoanTV t = Session["DangNhap"] as TaiKhoanTV;

			if (t.TKTV == null)
			{
				t = new TaiKhoanTV();
				Session["DangNhap"] = t;
				TempData["TBDangNhap"] = "Vui lòng đăng nhập!";
				Response.Cookies.Add(new HttpCookie("returnUrl", Request.Url.PathAndQuery));
				Response.Redirect(Url.Action("Login", "SignIn", new { area = "" }), true);
			}
		}
	}
}