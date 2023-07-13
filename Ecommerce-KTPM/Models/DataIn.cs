using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Ecommerce_KTPM.Models;

namespace Ecommerce_KTPM.Models
{
	public class DataIn
	{
		static EcommerceEntities db = new EcommerceEntities();
		public static List<NganhHang> GetNganhHangs()
		{

			return new EcommerceEntities().NganhHangs.ToList<NganhHang>();
		}
		public static List<SanPham> GetSanPhams()
		{

			return new EcommerceEntities().SanPhams.OrderByDescending(z => z.ngayDang).ToList();
		}
		public static List<SanPham> GetSanPhamsNB()
		{

			return new EcommerceEntities().SanPhams.OrderByDescending(z => z.giamGia).ToList();
		}
		public static List<SanPham> GetSPTheoLoai(int maLoai)
		{

			return new EcommerceEntities().SanPhams.Where(m => m.maLoai == maLoai).OrderByDescending(z => z.ngayDang).ToList();
		}
		public static List<LoaiSP> GetLoaiSPs()
		{

			return new EcommerceEntities().LoaiSPs.ToList<LoaiSP>();
		}
		public static IEnumerable<SelectListItem> GetNganhHangTolist()
		{
			var List = GetNganhHangs();
			return (IEnumerable<SelectListItem>)new SelectList(List, "maNganh", "tenNganh");
		}
		public static List<LoaiSP> GetLSPTheoNganh(int maNganh)
		{
			return new EcommerceEntities().LoaiSPs.Where(m => m.maNganh == maNganh).ToList();
		}
		public static List<TaiKhoanTV> GetTaiKhoanTVs()
		{
			return new EcommerceEntities().TaiKhoanTVs.ToList();
		}
		public static SanPham GetProductbyID(string maSP)
		{
			return db.SanPhams.Find(maSP);
		}
		public static List<DonHang> GetDonHangsmua(string tktv2)
		{
			return db.DonHangs.Where(m => m.tktv2 == tktv2).ToList();
		}
		public static List<DonHang> GetDonHangsban(string tktv1)
		{
			return db.DonHangs.Where(m => m.tktv1 == tktv1).ToList();
		}
		public static List<CtDonHang> GetCtDonHangs(string maDH)
		{
			return db.CtDonHangs.Where(m => m.soDH.Equals(maDH)).ToList();
		}
		public static GiaoHang GetGiaoHang(string maKH)
		{
			return db.GiaoHangs.Find(maKH);
		}
		public static TaiKhoanTV GetTaiKhoanTV(string tktv)
		{
			return db.TaiKhoanTVs.Find(tktv);
		}
		public static List<ThongBao> GetYeuCau(string tktv)
		{
			return db.ThongBaos.Where(m => m.TKQT == tktv).ToList();
		}
		public static List<SanPham> GetSPTheoTK(String taiKhoan)
		{

			return new EcommerceEntities().SanPhams.Where(m => m.taiKhoan == taiKhoan).OrderByDescending(z => z.ngayDang).ToList();
		}
		public static string TrangThaiDonHang(String SoDH)
		{
			DonHang dh = db.DonHangs.Find(SoDH);
			if (dh.daKichHoat == true && (dh.trangThai == null || dh.trangThai == ""))
			{
				return "<button class=\"btn btn-info\">Đã xác nhận</button>";
			}
			else if (dh.daKichHoat == false && (dh.trangThai == null || dh.trangThai == ""))
			{
				return "<button class=\"btn btn-info\">Đang chờ xác nhận</button>";
			}
			else
			{
				if (dh.trangThai != null && dh.trangThai.Equals("TC"))
				{
					return "<button class=\"btn btn-success\">Thành công</button>";
				}
				else if (dh.trangThai != null && dh.trangThai.Equals("HUY"))
				{
					return "<button class=\"btn btn-danger\">Đã huỷ</button>";
				}
				else if (dh.trangThai != null && dh.trangThai.Equals("ChL"))
				{
					return "<button class=\"btn btn-info\">Chờ lấy hàng</button>";
				}
				else if (dh.trangThai != null && dh.trangThai.Equals("DG"))
				{
					return "<button class=\"btn btn-info\">Đang giao</button>";
				}
				else if (dh.trangThai != null && dh.trangThai.Equals("TH"))
				{
					return "<button class=\"btn btn-primary\">Trả hàng</button>";
				}

			}
            return "";
        }
	}
}