//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Ecommerce_KTPM.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class OTP
    {
        public string TKTV { get; set; }
        public string MaOTP { get; set; }
        public Nullable<System.DateTime> thoiGian { get; set; }
        public string ghiChu { get; set; }
    
        public virtual TaiKhoanTV TaiKhoanTV { get; set; }
    }
}
