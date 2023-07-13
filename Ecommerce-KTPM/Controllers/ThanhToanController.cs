using Ecommerce_KTPM.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ecommerce_KTPM.Controllers
{
    public class ThanhToanController : BaoMatController
    {
		// GET: ThanhToan
		static EcommerceEntities db = new EcommerceEntities();
		public ActionResult Checkout()
		{
			TaiKhoanTV x = Session["DangNhap"] as TaiKhoanTV;
			GiaoHang y = db.GiaoHangs.Find(x.TKTV);
			if (y == null)
			{
				y = new GiaoHang();
				y.maKH = x.TKTV;
				y.tenKH = x.tenTV;
				y.soDT = x.soDT;
				y.email = x.email;
				y.diaChi = x.diaChi;
			}
			return View(y);
		}
		[HttpPost]
		public ActionResult SaveToData(GiaoHang x)
		{
			using (var db = new EcommerceEntities())
			{
				using (DbContextTransaction trans = db.Database.BeginTransaction())
				{
					try
					{
						TaiKhoanTV a = Session["DangNhap"] as TaiKhoanTV;
						//Kiểm tra xem có phải khách hàng mới hay không
						if (db.GiaoHangs.Find(a.TKTV) == null)
						{
							// new customer object and add to GiaoHang domain
							x.maKH =a.TKTV;
							if (x.gioiTinh == null) x.gioiTinh = true;
							if (x.email == null) x.email = "";
							if (x.ghiChu == null) x.ghiChu = "";
							//Add customer info  to data model
							db.GiaoHangs.Add(x);
							// save to database
							db.SaveChanges();
							Shopcart gh = Session["GioHang"] as Shopcart;
							List<string> listSoDH = new List<string>();
							foreach (var i in gh.ShopKhac())
							{
								DonHang d = new DonHang();
								//update order  info to donhang object you have just created before
								d.soDH = string.Format("{0:yyMMddhhmmssfff}", DateTime.Now);
								d.tktv1 = i;
								d.tktv2 = x.maKH;
								d.ngayDat = DateTime.Now;
								d.ngayGH = DateTime.Now.AddDays(2);
								d.diaChiGH = x.diaChi;
								d.ghiChu = x.ghiChu;
								d.daKichHoat = false;
								d.trangThai = "";
								//Add mordel info to datamodel
								db.DonHangs.Add(d);
								//save to database
								db.SaveChanges();
								foreach (var b in gh.spChon)
								{
									if (i == db.SanPhams.Find(b.Key).taiKhoan)
									{
										CtDonHang ctDonHang = b.Value;
										ctDonHang.soDH = d.soDH;
										db.CtDonHangs.Add(ctDonHang);
										db.SaveChanges();
									}

								}
								listSoDH.Add(d.soDH);
							}
							db.SaveChanges();
							//finish and commit all
							trans.Commit();
							Session["GioHang"] = gh;
							TempData["listSoDH"] = listSoDH;
							return RedirectToAction("CheckoutSuccess", "ThanhToan");
						}
						else
						{
							GiaoHang giaoHang = db.GiaoHangs.Find(a.TKTV);
							if (x.gioiTinh != null) giaoHang.gioiTinh = x.gioiTinh;
							if (x.email != null) giaoHang.email = x.email;
							if (x.ghiChu != null) giaoHang.ghiChu = x.ghiChu;
							//Add customer info  to data model
							// save to database
							db.SaveChanges();
							Shopcart gh = Session["GioHang"] as Shopcart;
							List<string> listSoDH = new List<string>();
							foreach (var i in gh.ShopKhac())
							{
								DonHang d = new DonHang();
								//update order  info to donhang object you have just created before
								d.soDH = string.Format("{0:yyMMddhhmmssfff}", DateTime.Now);
								d.tktv1 = i;
								d.tktv2 = giaoHang.maKH;
								d.ngayDat = DateTime.Now;
								d.ngayGH = DateTime.Now.AddDays(2);
								d.diaChiGH = x.diaChi;
								if (x.ghiChu != null) d.ghiChu = x.ghiChu;
								d.daKichHoat = false;
								d.trangThai = "";
								//Add mordel info to datamodel
								db.DonHangs.Add(d);
								//save to database
								db.SaveChanges();
								foreach (var b in gh.spChon)
								{
									if (i == db.SanPhams.Find(b.Key).taiKhoan)
									{
										CtDonHang ctDonHang = b.Value;
										ctDonHang.soDH = d.soDH;
										db.CtDonHangs.Add(ctDonHang);
										db.SaveChanges();
									}

								}
								listSoDH.Add(d.soDH);
							}
							db.SaveChanges();
							//finish and commit all
							trans.Commit();
							Session["GioHang"] = gh;
							TempData["listSoDH"] = listSoDH;
							return RedirectToAction("CheckoutSuccess", "ThanhToan");
						}
					}
					catch (Exception e)
					{
						trans.Rollback();
						string s = e.Message;
					}
				}
			}
			return RedirectToAction("Checkout", "ThanhToan");
		}
		public ActionResult CheckoutSuccess()
		{
			TaiKhoanTV x = Session["DangNhap"] as TaiKhoanTV;
			Session["GioHang"] = new Shopcart();
			// Xóa cookie có tên "Cart"
			HttpCookie cartCookie = Request.Cookies["Cart"];
			if (cartCookie != null)
			{
				cartCookie.Expires = DateTime.Now.AddDays(-1);
				Response.Cookies.Add(cartCookie);
			}
			List<string> listSoDH = TempData["listSoDH"] as List<string>;
			try
			{
				foreach (string s in listSoDH)
				{
					SendEmail.SendEmailDonHang(x.TKTV, s);
				}
				foreach (string s in listSoDH)
				{
					DonHang DH = db.DonHangs.Find(s);
					SendEmail.SendEmailDonHangNBan(DH.tktv1, s);
				}
			}
			catch (Exception e)
			{
				return View();

			}
			return View();

		}

	}
}