using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Timers;
using System.Web;



namespace Ecommerce_KTPM.Models
{
	// Class giúp mã hóa chuỗi sử dụng thuật toán SHA1
	public class CryptoService
	{
		// Hàm tính toán mã SHA1 cho chuỗi đầu vào
		// và trả về kết quả dưới dạng chuỗi 40 ký tự
		public static string ComputeSha1Hash(string rawData)
		{
			// Sử dụng SHA1Managed để bảo mật tính toán
			using (SHA1Managed sha1 = new SHA1Managed())
			{
				// Chuyển đổi chuỗi đầu vào sang mảng byte
				byte[] bytes = Encoding.UTF8.GetBytes(rawData);

				// Tính toán mã hóa cho mảng byte
				byte[] hash = sha1.ComputeHash(bytes);

				// Chuyển đổi kết quả mã hóa sang chuỗi dạng hexa
				// và trả về chuỗi có độ dài bằng 40 ký tự
				return BitConverter.ToString(hash).Replace("-", "").ToLower();
			}
		}
        public static ulong GenerateOTP()
        {
            var randomBytes = new byte[32];
            using (var rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(randomBytes);
            }

            var sha1 = SHA1.Create();
            var hashedBytes = sha1.ComputeHash(randomBytes);

            // Tạo một chuỗi hệ thập lục phân dựa trên các byte ngẫu nhiên sinh ra bởi RNGCryptoServiceProvider
            var otpHexString = BitConverter.ToString(hashedBytes).Replace("-", "");

            // Chuyển đổi chuỗi hệ thập lục phân thành số ulong
            var otpNumber = Convert.ToUInt64(otpHexString.Substring(0, 16), 16);

            // Giới hạn lại giá trị của số OTP thành 6 số bằng cách sử dụng phép chia lấy phần dư với 10^6
            otpNumber = otpNumber % 1000000;
            return otpNumber;
        }
        public static string GeneratePassword(int length)
		{
			const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			var random = new Random();
			var password = new char[length];
			for (int i = 0; i < length; i++)
			{
				password[i] = chars[random.Next(chars.Length)];
			}
			return new string(password);
		}

		public static void ScheduleExpiryTime(string tktv, int expirySeconds)
		{
			// Tính toán thời gian hết hạn của mã OTP
			var expiryTime = DateTime.Now.AddSeconds(expirySeconds);

			// Tạo một instance của class Timer với khoảng thời gian là expirySeconds giây
			var timer = new Timer(expirySeconds * 1000);

			// Đăng ký một Event Handler cho sự kiện Elapsed của Timer
			timer.Elapsed += new ElapsedEventHandler(delegate (object sender, ElapsedEventArgs e)
			{
				// Khi Timer đã kết thúc (hết giờ), chúng ta sẽ gọi hàm DeleteOTP để xóa mã OTP
				DeleteOTP(tktv);

				// Stop Timer để ngăn nó gọi lại khi đã được hủy
				timer.Stop();

				// Hủy Timer để giải phóng tài nguyên
				timer.Dispose();
			});

			// Khởi động Timer để bắt đầu đếm thời gian
			timer.Start();
		}
		public static void DeleteOTP(string tktv)
		{
			EcommerceEntities db = new EcommerceEntities();
			OTP t = db.OTPs.Find(tktv);
            foreach (OTP i in (new EcommerceEntities().OTPs.Where(m => m.TKTV == tktv).ToList()))
            {
                OTP a = db.OTPs.Find(tktv, i.MaOTP);
                db.OTPs.Remove(a);
            }
            db.SaveChanges();
			
		}



	}
}