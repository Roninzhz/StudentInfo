using Model;
using SQLDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentInfo
{
    public partial class UserEditPwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = int.Parse(Session["uName"].ToString());
                GetData(id);//获取数据
            }
        }
        public void GetData(int id)
        {
            DALadmin_user dal = new DALadmin_user();
            admin_userEntity users = dal.Getadmin_user(id);
            ViewState["user"] = users;
            UserId.Value = users.UserName;
            //将取回的数据在页面进行展示，可以修改的数据使用TextBox来展示，并提供修改。
            //通过按钮触发，实现将数据编辑保存的功能
        }
        //public void LoadData()
        //{
        //    string bian = Session["uName"].ToString();
        //    string conditon = string.Empty;
        //    if (!string.IsNullOrEmpty(bian))
        //    {
        //        conditon += "UserName='" + bian + "'";
        //    }
        //    DALadmin_user dal = new DALadmin_user();

        //    IList<admin_userEntity> ad = dal.Getadmin_usersbyCondition(conditon);
        //    if (ad.Count != 0)
        //    {             //判断是否为空
        //        for (int i = 0; i < ad.Count(); i++)
        //        {              //for循环将数据逐一获取到
        //            admin_userEntity defCodeInfoResDto = ad[i];
        //        }
        //        int j = ad[1].Id;
        //        admin_userEntity admin = dal.Getadmin_user(j);
        //        ViewState["admin"] = admin;//在当前页缓存数据。
        //        UserId.Value = admin.UserName;//加载显示数据
        //        //Password1.Value = admin.UserPassword;
        //    }
        //}
        protected void btnedit_Click(object sender, EventArgs e)
        {
            DALadmin_user dal = new DALadmin_user();
            admin_userEntity admin = (admin_userEntity)ViewState["user"];//获取缓存数据
            if (admin.UserPassword == Password1.Value)
            {
                admin.UserPassword = L_repass.Value;
                dal.Modadmin_user(admin);//提交到数据库
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('修改成功！');</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('修改失败，请检查密码正确性！');</script>");
            }
        }
    }
}