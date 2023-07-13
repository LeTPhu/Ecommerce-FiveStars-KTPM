using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Ecommerce_KTPM.Models;
using Newtonsoft.Json;

namespace Ecommerce_KTPM.Models
{
	public class ThongKe
	{
		static EcommerceEntities db = new EcommerceEntities();
		public static int SoLuongDonTrongNgay(DateTime ngay, string tktv1)
		{
			return db.DonHangs.Where(m => m.ngayDat.Value.Month ==  ngay.Month && m.ngayDat.Value.Year ==  ngay.Year && m.ngayDat.Value.Day == ngay.Day && m.tktv1==tktv1).Count(); ;
		}
		public static long DoanhThuTrongNgay(DateTime ngay, string tktv1)
		{
			long tien = 0;
			var DonHang = db.DonHangs.Where(m => m.ngayDat.Value.Month == ngay.Month && m.ngayDat.Value.Year == ngay.Year && m.ngayDat.Value.Day == ngay.Day && m.tktv1 == tktv1).ToList();
			foreach (var i in DonHang) 
			{
				tien += TinhToan.tongTien(i.soDH);
			}
			return tien;
		}
		public static long DoanhThuTrongThang(int thang, string tktv1)
		{
			long tien = 0;
			var DonHang = db.DonHangs.Where(m=>m.tktv1 == tktv1 && m.ngayDat.Value.Year == DateTime.Now.Year && m.ngayDat.Value.Month == thang).ToList();
			foreach(var i in DonHang)
			{
				tien += TinhToan.tongTien(i.soDH);
			}
			return tien;
		}
		public static int SoDonTrongThang(int thang, string tktv1)
		{
			return db.DonHangs.Where(m => m.tktv1 == tktv1 && m.ngayDat.Value.Month == thang && m.ngayDat.Value.Year == DateTime.Now.Year).Count();

		}
		public static long DoanhThuQuy(int Quy, string tktv1)
		{
			int[] thang = new int[3];
			long tien = 0;
			switch (Quy)
			{
				case 1: thang = new int[3] { 1, 2, 3}; break;
				case 2: thang = new int[3] { 4, 5, 6 }; break;
				case 3: thang = new int[3] { 7, 8, 9 }; break;
				case 4: thang = new int[3] { 10, 11, 12 }; break;
			}
			var DonHang = db.DonHangs.Where(m => m.tktv1 == tktv1 && m.ngayDat.Value.Year == DateTime.Now.Year).ToList();
			foreach (var i in DonHang)
			{
				if (i.ngayDat.Value.Month == thang[0] || i.ngayDat.Value.Month == thang[1] || i.ngayDat.Value.Month == thang[2]) 
				{
					tien += TinhToan.tongTien(i.soDH);
				}
			}
			return tien;
		}
		public static string DoanhThuCacQuyTrongNam(string tktv1)
		{
			List<long> tien =new List<long>();
			for (int i=1 ;i <= 4; i++)
			{
				tien.Add(DoanhThuQuy(i,tktv1));
			}
			return JsonConvert.SerializeObject(tien);
		}
		public static string SoSanPhamBanRaCacThangTrongNam(string tktv1)
		{
			List<int> soluong = new List<int>();
			for (int i = 1; i <= 12; i++)
			{
				soluong.Add(SoDonTrongThang(i, tktv1));
			}
			return JsonConvert.SerializeObject(soluong);
		}


	}
}