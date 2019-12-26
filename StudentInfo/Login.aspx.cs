﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using SQLDAL;

namespace StudentInfo
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["CheckCode"];
            string username = user_name.Value;
            string password = pass_word.Value;
            SQLDAL.DALadmin_user dALadmin_User = new DALadmin_user();
            SQLDAL.DALstudent_info dALstudent_Info = new DALstudent_info();
            IList<student_infoEntity> students = dALstudent_Info.Getstudent_infosbyCondition("studentName='" + username + "' and StudentPassword='" + password + "'");
            IList<admin_userEntity> users = dALadmin_User.Getadmin_usersbyCondition("userName='" + username + "' and userPassword='" + password + "'");
            if (users.Count > 0&& cookie.Value == CheckCode.Value)
            {
                Session["uName"] = "你好，管理员："+username;
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('登录成功');location.href='index.aspx';</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('用户名或密码或验证码错误');</script>");
            }
        }

        protected void btnsubmit1_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["CheckCode"];
            string username = user_name.Value;
            string password = pass_word.Value;
            SQLDAL.DALstudent_info dALstudent_Info = new DALstudent_info();
            IList<student_infoEntity> students = dALstudent_Info.Getstudent_infosbyCondition("studentName='" + username + "' and StudentPassword='" + password + "'");
            if (students.Count> 0 && cookie.Value == CheckCode.Value)
            {
                Session["uName"] = "学生：" + username;
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('登录成功');location.href='index.aspx';</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('用户名或密码或验证码错误');</script>");
            }
        }
    }
}