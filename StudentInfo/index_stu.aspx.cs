﻿using System;

namespace StudentInfo
{
    public partial class index_stu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltCurUser.Text = "当前用户：游客";
            if (Session["name"] != null)
            {
                ltCurUser.Text = "你好，学生：" + Session["name"];
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录');location.href='Login.aspx';</script>");
            }
        }
    }
}