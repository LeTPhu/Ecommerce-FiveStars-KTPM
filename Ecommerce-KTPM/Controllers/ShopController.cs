using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ecommerce_KTPM.Models;
namespace Ecommerce_KTPM.Controllers
{
    public class ShopController : Controller
    {
        // GET: Shop
        EcommerceEntities db = new EcommerceEntities();
        public ActionResult Shop(int maNganhHang)
        {
            NganhHang x = db.NganhHangs.Find(maNganhHang);
            ViewData["ViewNH"] = x;
            return View();
        }
        public ActionResult ShopDetail(string maSanPham)
        {
            //--- Dua vao LinQ de lay san pham tu data models
            SanPham x = db.SanPhams.Find(maSanPham);
            ViewData["ViewSP"] = x;
            return View();
        }
        public ActionResult ShopSP(int maLoaiSP)
        {
            LoaiSP x = db.LoaiSPs.Find(maLoaiSP);
            ViewData["ViewLSP"] = x;
            return View();
        }
        public ActionResult ShopTK(string tenTKShop) 
        {
            ViewBag.tenTKShop = tenTKShop;
            List<SanPham> x = DataIn.GetSPTheoTK(tenTKShop);
            ViewData["ViewTK"] = x;
            return View(); 
        }
    }
}