using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ecommerce_KTPM.Models
{
	public class Shopcart
	{
		static EcommerceEntities db = new EcommerceEntities();
		public SortedList<string, CtDonHang> spChon { get; set; }
		public Shopcart()
		{
			this.spChon = new SortedList<string, CtDonHang>();
		}
		public List<string> ShopKhac()
		{
			List<string> list=new List<string>();
			foreach (string i in spChon.Keys)
			{
				SanPham x = db.SanPhams.Find(i);
				list.Add(x.taiKhoan);
			}
			return list.Distinct().ToList();
		}
		//---neu ko co san pham chon mua thi tra ve true
		public Boolean IsEmpty()
		{
			return (spChon.Keys.Count == 0);
		}
		
		//--add san pham
		public void addItem(string maSP)
		{
			if (spChon.Keys.Contains(maSP))
			{
				//Lấy sản phẩm trong giỏ hàng
				CtDonHang x = spChon.Values[spChon.IndexOfKey(maSP)];
				x.soLuong++;
			}
			else
			{
				CtDonHang i = new CtDonHang();
				i.maSP = maSP;
				i.soLuong = 1;
				SanPham z = DataIn.GetProductbyID(maSP);
				i.giaBan = z.giaBan;
				i.giamGia = z.giamGia;
				// nem vao gio hang
				spChon.Add(maSP, i);
			}
		}

		// giam so luong hoac xoa san pham
		public void deleteItem(string maSP)
		{
			if (spChon.Keys.Contains(maSP))
				spChon.Remove(maSP);
		}
		public void GiamSP(string maSP)
		{
			if (spChon.Keys.Contains(maSP))
			{
				CtDonHang x = spChon.Values[spChon.IndexOfKey(maSP)];
				if (x.soLuong > 1)
				{
					x.soLuong--;
					//spChon.Values[spChon.IndexOfKey(maSP)].soLuong = x.soLuong;
				}
				else
					deleteItem(maSP);
			}
		}
		// Tính tiền 1 sản phẩm
		public long tien1Sp(CtDonHang x)
		{
			return (long)(x.giaBan * x.soLuong - (x.giaBan * x.soLuong * x.giamGia / 100));
		}
		// Tính số tiền đã giảm giá
		public long tienDaGiamGia()
		{
			long tienGiam = 0;
			foreach (CtDonHang i in spChon.Values)
				tienGiam += (long)(i.giaBan * i.soLuong * i.giamGia / 100);
			return tienGiam;
		}
		public long tongGia()
		{
			long kq = 0;
			foreach (CtDonHang i in spChon.Values)
				kq += (long)(i.giaBan * i.soLuong);
			return kq;
		}
		public long tongTien()
		{
			long kq = 0;
			foreach (CtDonHang i in spChon.Values)
				kq += tien1Sp(i);
			return kq;
		}
		public int tongSP()
		{
			int soLuong = 0;
			foreach (CtDonHang i in spChon.Values)
				soLuong += (int)i.soLuong;
			return soLuong;
		}
	}
}