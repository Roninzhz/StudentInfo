using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using SQLDAL;
namespace StudentInfo
{
    public partial class StudentFind : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LoadData()
        {
            string conditon = string.Empty;
            conditon = "(StudentId is not null and StudentId<>' ')";
            if (!string.IsNullOrEmpty(select.Value))
            {
                conditon += " and StudentName='" + select.Value + "'";
            }
            DALstudent_info dal = new DALstudent_info();
            IList<student_infoEntity> admins = dal.Getstudent_infosbyCondition(conditon);//按照条件来查询数据
            grdusers.DataSource = admins;
            grdusers.DataBind();
        }
        protected void grdusers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowindex = int.Parse(e.CommandArgument.ToString());//获取操作行的行号
            string Id = grdusers.DataKeys[rowindex].Value.ToString();//获取操作行数据的主键Id
            DALstudent_info dal = new DALstudent_info();//定义针对admin_user表的操作对象

            switch (e.CommandName)//获取操作对象的命令
            {
                case "edit"://调转到编辑页面
                    Response.Redirect("?id=" + Id);
                    break;
                case "del"://删除用户
                    dal.Delstudent_info(int.Parse(Id));
                    LoadData();//重新加载数据，验证是否成功删除
                    Response.Write("<script>alert('数据删除成功！')</script>");
                    break;
                case "reset"://修改密码
                    student_infoEntity u = dal.Getstudent_info(int.Parse(Id));
                    u.StudentPassword = "123456";
                    dal.Modstudent_info(u);
                    LoadData();//重新加载数据，验证是否重置
                    Response.Write("<script>alert('用户密码重置成功，新密码123456')</script>");
                    break;
            }
        }

        protected void grdusers_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //LinkButton lb1 = (LinkButton)e.Row.FindControl("lb1");
                //lb1.CommandArgument = e.Row.RowIndex.ToString();//为每个操作对象设定行号信息。
                LinkButton lb2 = (LinkButton)e.Row.FindControl("lb2");
                lb2.CommandArgument = e.Row.RowIndex.ToString();
                LinkButton lb3 = (LinkButton)e.Row.FindControl("lb3");
                lb3.CommandArgument = e.Row.RowIndex.ToString();
            }
        }

        protected void btnselect_Click(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}