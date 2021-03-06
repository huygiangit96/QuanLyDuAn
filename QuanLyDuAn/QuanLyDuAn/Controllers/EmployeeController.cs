﻿using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyDuAn.Common;
using Model.ViewModel;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;

namespace QuanLyDuAn.Controllers
{
    public class EmployeeController : SecurityController
    {
        // GET: Employee
        public ActionResult Index()
        {
            List<NhanVienViewModel> modal = new NhanVienDAO().ListAll();
            ViewBag.PhongBan = new PhongBanDAO().ListAll();
            ViewBag.VaiTro = new VaiTroDAO().ListAll();
            return View(modal);
        }

        [HasCredential(RoleID = "CREATE_NHANVIEN")][HttpPost]
        public JsonResult Insert(string name, string address, long department, long role, string bank, string phone, string level, string email, string username, string pass)
        {
            NhanVien item = new NhanVien();
            item.Ten = name;
            item.DiaChi = address;
            item.MaPB = department;
            item.MaVT = role;
            item.SoTK = bank;
            item.SoDT = phone;
            item.TrinhDo = level;
            item.Email = email;
            item.TaiKhoan = username;
            item.MatKhau = GetMD5(pass);
            bool result = new NhanVienDAO().Insert(item);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HasCredential(RoleID = "UPDATE_NHANVIEN")][HttpPost]
        public JsonResult Edit(long code, string name, string address, long department, long role, string bank, string phone, string level, string email)
        {
            NhanVien item = new NhanVien();
            item.MaNV = code;
            item.Ten = name;
            item.DiaChi = address;
            item.MaPB = department;
            item.MaVT = role;
            item.SoTK = bank;
            item.SoDT = phone;
            item.TrinhDo = level;
            item.Email = email;
            bool result = new NhanVienDAO().Update(item);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HasCredential(RoleID ="DELETE_NHANVIEN")]
        public JsonResult Delete(long id)
        {
            bool result = new NhanVienDAO().Delete(id);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Get(long id)
        {
            NhanVien item = new NhanVienDAO().GetByID(id);

            return Json(item, JsonRequestBehavior.AllowGet);
        }
        private String GetMD5(string txt)
        {
            String str = "";
            Byte[] buffer = System.Text.Encoding.UTF8.GetBytes(txt);
            System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            buffer = md5.ComputeHash(buffer);
            foreach (Byte b in buffer)
            {
                str += b.ToString("X2");
            }
            return str;
        }
    }
}