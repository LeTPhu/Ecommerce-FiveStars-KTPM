using Ecommerce_KTPM.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ecommerce_KTPM.Controllers
{
    public class GioHangController : Controller
    {
		// GET: GioHang
		EcommerceEntities db = new EcommerceEntities();
		public ActionResult Cart()
        {
            return View();
        }
		[HttpPost]
		public ActionResult AddToCart(string maSP)
		{
			Shopcart gh = Session["GioHang"] as Shopcart;
			gh.addItem(maSP);
			Session["GioHang"] = gh;
			// Đọc cookie và chuyển đổi nó trở lại danh sách sản phẩm
			HttpCookie cartCookie = Request.Cookies["Cart"];
			List<string> productList = new List<string>();

			if (cartCookie != null)
			{
				productList = JsonConvert.DeserializeObject<List<String>>(cartCookie.Value);
			}

			// Thêm sản phẩm mới vào danh sách
			string newProduct = maSP;
			productList.Add(newProduct);

			// Lưu danh sách sản phẩm trở lại cookie
			HttpCookie newCartCookie = new HttpCookie("Cart");
			newCartCookie.Value = JsonConvert.SerializeObject(productList);
			newCartCookie.Expires = DateTime.Now.AddDays(7);
			// Ghi cookie vào máy tính của khách hàng
			Response.Cookies.Add(newCartCookie);
			return Redirect("Cart");
		}
		[HttpPost]
		public ActionResult Increase(string maSP)
		{
			Shopcart gh = Session["GioHang"] as Shopcart;
			gh.addItem(maSP);
			Session["GioHang"] = gh;
			// Đọc cookie và chuyển đổi nó trở lại danh sách sản phẩm
			HttpCookie cartCookie = Request.Cookies["Cart"];
			List<string> productList = new List<string>();

			if (cartCookie != null)
			{
				productList = JsonConvert.DeserializeObject<List<String>>(cartCookie.Value);
			}

			// Thêm sản phẩm mới vào danh sách
			string newProduct = maSP;
			productList.Add(newProduct);

			// Lưu danh sách sản phẩm trở lại cookie
			HttpCookie newCartCookie = new HttpCookie("Cart");
			newCartCookie.Value = JsonConvert.SerializeObject(productList);
			newCartCookie.Expires = DateTime.Now.AddDays(7);
			// Ghi cookie vào máy tính của khách hàng
			Response.Cookies.Add(newCartCookie);
			return View("Cart");
		}
		[HttpPost]
		public ActionResult Decrease(string maSP)
		{
			Shopcart gh = Session["GioHang"] as Shopcart;
			gh.GiamSP(maSP);
			Session["GioHang"] = gh;
			HttpCookie cartCookie = Request.Cookies["Cart"];
			List<string> productList = new List<string>();

			if (cartCookie != null)
			{
				productList = JsonConvert.DeserializeObject<List<string>>(cartCookie.Value);
			}
			foreach (string product in productList.ToList())
			{
				if (product == maSP)
				{
					productList.Remove(product);
					break;
				}
			}
			HttpCookie newCartCookie = new HttpCookie("Cart");
			newCartCookie.Value = JsonConvert.SerializeObject(productList);
			newCartCookie.Expires = DateTime.Now.AddDays(7);
			Response.Cookies.Add(newCartCookie);
			return View("Cart");
		}
		[HttpPost]
		public ActionResult Delete(string maSP)
		{
			Shopcart gh = Session["GioHang"] as Shopcart;
			gh.deleteItem(maSP);
			Session["GioHang"] = gh;
			HttpCookie cartCookie = Request.Cookies["Cart"];
			List<string> productList = new List<string>();

			if (cartCookie != null)
			{
				productList = JsonConvert.DeserializeObject<List<string>>(cartCookie.Value);
			}
			foreach (string product in productList.ToList())
			{
				if (product == maSP)
				{
					productList.Remove(product);
				}
			}
			HttpCookie newCartCookie = new HttpCookie("Cart");
			newCartCookie.Value = JsonConvert.SerializeObject(productList);
			newCartCookie.Expires = DateTime.Now.AddDays(7);
			Response.Cookies.Add(newCartCookie);
			return View("Cart");
		}

	}
}