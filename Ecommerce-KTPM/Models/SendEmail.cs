using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using static System.Net.Mime.MediaTypeNames;

namespace Ecommerce_KTPM.Models
{
	public class SendEmail
	{
		static EcommerceEntities db = new EcommerceEntities();
		public static void SendEmailOTP(string tktv)
		{
			// Khai báo biến từ địa chỉ email và tên người gửi
			var fromAddress = new MailAddress("nkiet0312@gmail.com", "FiveStars");
			TaiKhoanTV t = db.TaiKhoanTVs.Find(tktv);
			string email = t.email;
			string ten = t.hoDem + t.tenTV;
			// Khai báo biến địa chỉ email và tên người nhận
			var toAddress = new MailAddress(email, ten);

			// Thiết lập mật khẩu của email người gửi
			const string fromPassword = "Good782003@";

			// Thiết lập tiêu đề email
			const string subject = "Khôi phục mật khẩu";

            // Thiết lập ảnh đi kèm
            string imgUrl = "https://bachsykhang.github.io/myprofile/img/logoktpm.jpg";


			string maOTP = CryptoService.GenerateOTP().ToString();
			OTP maKhoiPhuc = new OTP();
			maKhoiPhuc.TKTV = t.TKTV;
			maKhoiPhuc.MaOTP = maOTP;
			maKhoiPhuc.thoiGian = DateTime.Now;
			maKhoiPhuc.ghiChu = "";
			db.OTPs.Add(maKhoiPhuc);
			db.SaveChanges();

			//Thiết lập nội dung email
			string body = "<p>Chúng tôi đến từ FiveStars , Vui lòng nhập OTP <b>" + maOTP + "</b> để xác thực khôi phục mật khẩu</p>"
				+ "\n<b>(Lưu ý rằng OTP chỉ tồn tại trong 2 phút)</b>"
				+ "<img style=\"display: block; height: 100%; width: 50%;\" src=\"" + imgUrl + "\">";

			CryptoService.ScheduleExpiryTime(t.TKTV, 180);


			// Khởi tạo đối tượng SmtpClient để kết nối tới máy chủ SMTP
			var smtp = new SmtpClient
			{
				Host = "smtp-mail.outlook.com", // Thiết lập địa chỉ máy chủ SMTP của Hotmail/Outlook
				Port = 587, // Thiết lập cổng SMTP
				EnableSsl = true, // Thiết lập SSL/TLS cho giao tiếp với SMTP server
				DeliveryMethod = SmtpDeliveryMethod.Network, // Phương thức gửi email là được gửi thông qua network
				Credentials = new NetworkCredential(fromAddress.Address, fromPassword), // Thông tin đăng nhập gồm địa chỉ email và mật khẩu của người gửi
				Timeout = 20000 // Thiết lập thời gian timeout cho quá trình gửi email
			};

			// Tạo đối tượng MailMessage để xây dựng nội dung email
			using (var message = new MailMessage(fromAddress, toAddress)
			{
				Subject = subject, // Thiết lập tiêu đề email
				IsBodyHtml = true,
				Body = body // Thiết lập nội dung email
			})
			{
				// Gửi email thông qua đối tượng SmtpClient
				try
				{
					smtp.Send(message);
				}
				catch (Exception e)
				{
					return;
				}
			}
		}

		public static void SendEmailDonHang(string tktv,string soDH)
		{
			// Khai báo biến từ địa chỉ email và tên người gửi
			var fromAddress = new MailAddress("nkiet0312@gmail.com", "FiveStars");
			TaiKhoanTV t = db.TaiKhoanTVs.Find(tktv);
			DonHang dh = db.DonHangs.Find(soDH);
			List<CtDonHang> listCTDonHang = DataIn.GetCtDonHangs(soDH);

			string email = t.email;
			string ten = t.hoDem + " " + t.tenTV;
            DateTime ngaydat = (DateTime)dh.ngayDat;
            DateTime ngaygiao = (DateTime)dh.ngayGH;
			
			// Khai báo biến địa chỉ email và tên người nhận
			var toAddress = new MailAddress(email, ten);

			// Thiết lập mật khẩu của email người gửi
			const string fromPassword = "Good782003@";

			// Thiết lập tiêu đề email
			const string subject = "Thông báo về đơn hàng của bạn!";

			// Thiết lập ảnh đi kèm
			string imgUrl = "https://bachsykhang.github.io/myprofile/img/logoktpm.jpg";


            // Thiết lập nội dung đơn hàng
            string body = "<span>Xin chào </span>" + "<span style=\"color: red;\">" + ten + "</span>" + ",<br/>";
            body += "<span>Đơn hàng </span>" + "<span style=\"color: red;\">" + soDH + "</span>" + " <span> đã đặt thành công, ngày giao dự kiến là:" + ngaygiao + "</span><br/>";
            body += "<span style=\"font-weight: 550;\">Thông tin đơn hàng: </span><br/>";
            body += "<table style=\"\"><tr><th style=\"border: 1px solid; background: #d1d1d1;\">Tên sản phẩm</th><th style=\"border: 1px solid; background: #d1d1d1;\">Số lượng</th></tr>";
			foreach(var i in listCTDonHang)
			{
				body += "<tr><td style=\"border: 1px solid; width: 470px;\">" + DataIn.GetProductbyID(i.maSP).tenSP + "</td><td style=\"border: 1px solid; width: 60px; text-align: center; " +
					"text-alight: center;\">" + i.soLuong + "</td></tr></table>";

			}
			body += "<span style=\"color: blue;\">FiveStars chân thành cảm ơn các bạn tin tưởng và ủng hộ chúng tôi.</span><br/>";
            body += "<img style=\"display: block; height: 100%; width: 50%;\" src=\"" + imgUrl + "\">";



			// Khởi tạo đối tượng SmtpClient để kết nối tới máy chủ SMTP
			var smtp = new SmtpClient
			{
				Host = "smtp-mail.outlook.com", // Thiết lập địa chỉ máy chủ SMTP của Hotmail/Outlook
				Port = 587, // Thiết lập cổng SMTP
				EnableSsl = true, // Thiết lập SSL/TLS cho giao tiếp với SMTP server
				DeliveryMethod = SmtpDeliveryMethod.Network, // Phương thức gửi email là được gửi thông qua network
				Credentials = new NetworkCredential(fromAddress.Address, fromPassword), // Thông tin đăng nhập gồm địa chỉ email và mật khẩu của người gửi
				Timeout = 20000 // Thiết lập thời gian timeout cho quá trình gửi email
			};

			// Tạo đối tượng MailMessage để xây dựng nội dung email
			using (var message = new MailMessage(fromAddress, toAddress)
			{
				Subject = subject, // Thiết lập tiêu đề email
				IsBodyHtml = true,
				Body = body // Thiết lập nội dung email
			})
			{
				// Gửi email thông qua đối tượng SmtpClient
				try
				{
					smtp.Send(message);
				}
				catch (Exception e)
				{
					return;
				}
			}
		}
		public static void SendEmailDonHangNBan(string tktv, string soDH)
		{
			// Khai báo biến từ địa chỉ email và tên người gửi
			var fromAddress = new MailAddress("nkiet0312@gmail.com", "FiveStars");
			TaiKhoanTV t = db.TaiKhoanTVs.Find(tktv);
			DonHang dh = db.DonHangs.Find(soDH);

			string email = t.email;
			string ten = t.hoDem +" " +t.tenTV;
			DateTime ngaydat = (DateTime)dh.ngayDat;
			DateTime ngaygiao = (DateTime)dh.ngayGH;

			// Khai báo biến địa chỉ email và tên người nhận
			var toAddress = new MailAddress(email, ten);

			// Thiết lập mật khẩu của email người gửi
			const string fromPassword = "Good782003@";

			// Thiết lập tiêu đề email
			const string subject = "Bạn có đơn hàng mới!";

			// Thiết lập ảnh đi kèm
			string imgUrl = "https://bachsykhang.github.io/myprofile/img/logoktpm.jpg";


			// Thiết lập nội dung đơn hàng
			string body = "<span>Xin chào </span>" + "<span style=\"color: red;\">" + ten + "</span>" + ",<br/>";
			body += "<span>Đơn hàng </span>" + "<span style=\"color: red;\">" + soDH + "</span>" + " <span> đã được đặt thành công, Vui lòng truy cập trang bán hàng của bạn để xem chi tiết và chuẩn bị hàng! </span><br/>";
			body += "<span style=\"color: blue;\">FiveStars chân thành cảm ơn các bạn tin tưởng và ủng hộ chúng tôi.</span><br/>";
			body += "<img style=\"display: block; height: 100%; width: 50%;\" src=\"" + imgUrl + "\">";


			// Khởi tạo đối tượng SmtpClient để kết nối tới máy chủ SMTP
			var smtp = new SmtpClient
			{
				Host = "smtp-mail.outlook.com", // Thiết lập địa chỉ máy chủ SMTP của Hotmail/Outlook
				Port = 587, // Thiết lập cổng SMTP
				EnableSsl = true, // Thiết lập SSL/TLS cho giao tiếp với SMTP server
				DeliveryMethod = SmtpDeliveryMethod.Network, // Phương thức gửi email là được gửi thông qua network
				Credentials = new NetworkCredential(fromAddress.Address, fromPassword), // Thông tin đăng nhập gồm địa chỉ email và mật khẩu của người gửi
				Timeout = 20000 // Thiết lập thời gian timeout cho quá trình gửi email
			};

			// Tạo đối tượng MailMessage để xây dựng nội dung email
			using (var message = new MailMessage(fromAddress, toAddress)
			{
				Subject = subject, // Thiết lập tiêu đề email
				IsBodyHtml = true,
				Body = body // Thiết lập nội dung email
			})
			{
				// Gửi email thông qua đối tượng SmtpClient
				try
				{
					smtp.Send(message);
				}
				catch (Exception e)
				{
					return;
				}
			}
		}


		public static void SendEmailHoTro(string name, string email, string chude, string noidung)
		{
			// Khai báo biến từ địa chỉ email và tên người gửi
			var fromAddress = new MailAddress("nkiet0312@gmail.com", "FiveStars");
			// Khai báo biến địa chỉ email và tên người nhận
			var toAddress = new MailAddress(email, name);

			// Thiết lập mật khẩu của email người gửi
			const string fromPassword = "Good782003@";

			// Thiết lập tiêu đề email
			const string subject = "Yêu cầu của bạn đã được gửi đi!";

			// Thiết lập ảnh đi kèm
			string imgUrl = "https://bachsykhang.github.io/myprofile/img/logoktpm.jpg";

			//Thiết lập nội dung email
			string body = "<img style=\"display: block; height: 100%; width: 15%;\" src=\"" + imgUrl + "\">" 
				+ "<p>Chúng tôi đến từ FiveStars , yêu cầu của bạn đã được gửi đi với nội dung</br>"+noidung;


			// Khởi tạo đối tượng SmtpClient để kết nối tới máy chủ SMTP
			var smtp = new SmtpClient
			{
				Host = "smtp-mail.outlook.com", // Thiết lập địa chỉ máy chủ SMTP của Hotmail/Outlook
				Port = 587, // Thiết lập cổng SMTP
				EnableSsl = true, // Thiết lập SSL/TLS cho giao tiếp với SMTP server
				DeliveryMethod = SmtpDeliveryMethod.Network, // Phương thức gửi email là được gửi thông qua network
				Credentials = new NetworkCredential(fromAddress.Address, fromPassword), // Thông tin đăng nhập gồm địa chỉ email và mật khẩu của người gửi
				Timeout = 20000 // Thiết lập thời gian timeout cho quá trình gửi email
			};

			// Tạo đối tượng MailMessage để xây dựng nội dung email
			using (var message = new MailMessage(fromAddress, toAddress)
			{
				Subject = subject, // Thiết lập tiêu đề email
				IsBodyHtml = true,
				Body = body // Thiết lập nội dung email
			})
			{
				// Gửi email thông qua đối tượng SmtpClient
				try
				{
					smtp.Send(message);
				}
				catch (Exception e)
				{
					return;
				}
			}
		}

		public static void SendEmailHoTroQT(string name, string email, string chude, string noidung)
		{
			// Khai báo biến từ địa chỉ email và tên người gửi
			var fromAddress = new MailAddress("nkiet0312@gmail.com", "FiveStars");
			// Khai báo biến địa chỉ email và tên người nhận
			var toAddress = new MailAddress("letanphu2906@gmail.com", "Quản trị viên - Phú");

			// Thiết lập mật khẩu của email người gửi
			const string fromPassword = "Good782003@";

			// Thiết lập tiêu đề email
			const string subject = "Bạn có một yêu cầu mới!";

			// Thiết lập ảnh đi kèm
			string imgUrl = "https://bachsykhang.github.io/myprofile/img/logoktpm.jpg";

			//Thiết lập nội dung email
			string body = "<img style=\"display: block; height: 100%; width: 30%;\" src=\"" + imgUrl + "\">" 
				+ "<p>Xin chào Quản trị viên , bạn có một yêu cầu mới với nội dung</br>" + noidung+"</br>Từ người gửi "+name+", Email: "+email;


			// Khởi tạo đối tượng SmtpClient để kết nối tới máy chủ SMTP
			var smtp = new SmtpClient
			{
				Host = "smtp-mail.outlook.com", // Thiết lập địa chỉ máy chủ SMTP của Hotmail/Outlook
				Port = 587, // Thiết lập cổng SMTP
				EnableSsl = true, // Thiết lập SSL/TLS cho giao tiếp với SMTP server
				DeliveryMethod = SmtpDeliveryMethod.Network, // Phương thức gửi email là được gửi thông qua network
				Credentials = new NetworkCredential(fromAddress.Address, fromPassword), // Thông tin đăng nhập gồm địa chỉ email và mật khẩu của người gửi
				Timeout = 20000 // Thiết lập thời gian timeout cho quá trình gửi email
			};

			// Tạo đối tượng MailMessage để xây dựng nội dung email
			using (var message = new MailMessage(fromAddress, toAddress)
			{
				Subject = subject, // Thiết lập tiêu đề email
				IsBodyHtml = true,
				Body = body // Thiết lập nội dung email
			})
			{
				// Gửi email thông qua đối tượng SmtpClient
				try
				{
					smtp.Send(message);
				}
				catch (Exception e)
				{
					return;
				}
			}
		}


	}
}