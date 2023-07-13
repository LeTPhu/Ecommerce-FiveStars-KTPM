using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Ecommerce_KTPM.Models;
using System.Xml.Linq;
using System.Web.Helpers;

namespace Ecommerce_KTPM.Controllers
{
    public class QuenMKController : Controller
    {
        // GET: QuenMK
		EcommerceEntities db = new EcommerceEntities();
        public ActionResult Index()
        {
            return View();
        }
		[HttpPost]
		public ActionResult KTraEmail(string email)
		{
			if (email != null)
			{
				email = email.Trim().ToLower();
				foreach (TaiKhoanTV i in DataIn.GetTaiKhoanTVs().Where(m => m.trangThai == true).ToList())
				{
					if (i.email.Equals(email))
					{
						string ten = i.hoDem + i.tenTV;
						SendEmail.SendEmailOTP(i.TKTV);
						return View("nhapOTP");
					}
				}

				ViewBag.mess = "Email của bạn nhập không chính xác. Vui lòng nhập lại!";
			}
			return View("Index");
		}
		public ActionResult nhapOTP()
		{
			ViewBag.mess = "Vui lòng nhập vào OTP được gửi đến Email của bạn vào ô dưới đây.";
			return View();
		}
		[HttpPost]
		public ActionResult KtraNhapOTP(string OTP)
		{
			if (OTP != null)
			{
				OTP = OTP.Trim();
				foreach (OTP i in (new EcommerceEntities().OTPs.ToList()))
				{
					if (i.MaOTP.Equals(OTP))
					{
                        TaiKhoanTV t = db.TaiKhoanTVs.Find(i.TKTV);
                        string ten = t.hoDem + t.tenTV;
						// Khai báo biến từ địa chỉ email và tên người gửi
						var fromAddress = new MailAddress("nkiet0312@gmail.com", "FiveStars");

						// Khai báo biến địa chỉ email và tên người nhận
						var toAddress = new MailAddress(t.email, ten);

						// Thiết lập mật khẩu của email người gửi
						const string fromPassword = "Good782003@";

						// Thiết lập tiêu đề email
						const string subject = "Khôi phục mật khẩu";
						string pass = CryptoService.GeneratePassword(10);
						t.matKhau = CryptoService.ComputeSha1Hash(pass);
						db.SaveChanges();
						// Thiết lập nội dung email
						string body = "Chúng tôi đến từ FiveStars , mật khẩu của bạn đã được reset thành: "+pass;

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
							Body = body // Thiết lập nội dung email
						})
							// Gửi email thông qua đối tượng SmtpClient
						try
						{
							smtp.Send(message);
						}
						catch (Exception e)
						{
							continue;
						}

						return View("ThanhCong");
					}
					else
					{
						ViewBag.mess = "OTP của bạn nhập không chính xác, hoặc đã hết hạn vui lòng kiểm tra lại!";
					}
				}

			}
			return View("nhapOTP");
		}
		public ActionResult ThanhCong()
		{
			return View();
		}
	}
}