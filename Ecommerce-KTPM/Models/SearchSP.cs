using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Web.Mvc;

namespace Ecommerce_KTPM.Models
{
    public class SearchSP
    {
        public static List<SanPham> SearchSanPham (string search)
        {
            List<SanPham> l = new List<SanPham>();
            DbContext db = new DbContext ("name=EcommerceEntities");
            l = db.Set<SanPham>().Where(x => x.tenSP.Contains(search) && x.daDuyet == true).ToList();
            return l;
        }

        public static List<LoaiSP> GetLoaiSPs()
        {
            DbContext db = new DbContext("name=EcommerceEntities");
            List<LoaiSP> loaiSPs = db.Set<LoaiSP>().ToList<LoaiSP>();
            return loaiSPs;
        }
    }
}