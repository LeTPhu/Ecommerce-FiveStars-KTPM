using Ecommerce_KTPM.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace Ecommerce_KTPM
{
	public class MvcApplication : System.Web.HttpApplication
	{
		protected void Application_Start()
		{
			AreaRegistration.RegisterAllAreas();
			FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
			RouteConfig.RegisterRoutes(RouteTable.Routes);
			BundleConfig.RegisterBundles(BundleTable.Bundles);
		}
		protected void Session_Start(object sender, EventArgs e)
		{
			Session["DangNhap"] = new TaiKhoanTV();
			//Tạo giỏ hàng cho người truy cập vào trang web
			Shopcart gh = new Shopcart();
			try
			{
				// Đọc cookie và chuyển đổi nó trở lại danh sách sản phẩm
				HttpCookie cartCookie = Request.Cookies["Cart"];
				List<string> productList = new List<string>();

				if (cartCookie != null)
				{
					productList = JsonConvert.DeserializeObject<List<String>>(cartCookie.Value);
				}

				// Thêm sản phẩm mới vào giỏ hàng
				foreach (string product in productList.ToList())
				{
					if ((new EcommerceEntities().SanPhams.Find(product)) == null)
						continue;
					else gh.addItem(product);
				}
				Session["GioHang"] = gh;
			}
			catch (Exception ex)
			{
				HttpCookie cartCookie = Request.Cookies["Cart"];
				if (cartCookie != null)
				{
					cartCookie.Expires = DateTime.Now.AddDays(-1);
					Response.Cookies.Add(cartCookie);
				}
			}
		}
	}
}
