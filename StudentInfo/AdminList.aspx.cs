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
    public partial class AdminList : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//页面首次加载自动执行
            {
                LoadData();
            }
        }


        /// <summary>
        /// 加载数据信息
        /// </summary>
        public void LoadData()
        {
            string conditon = string.Empty;
            conditon = "(UserName is not null and UserName<>' ')";
            if (!string.IsNullOrEmpty(select.Value))
            {
                conditon += " and UserName='" + select.Value + "'";
            }
            DALadmin_user dal = new DALadmin_user();
            IList<admin_userEntity> admins = dal.Getadmin_usersbyCondition(conditon);//按照条件来查询数据
            grdadmin.DataSource = admins;
            grdadmin.DataBind();
        }
        protected void grdadmin_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb1 = (LinkButton)e.Row.FindControl("lb1");
                lb1.CommandArgument = e.Row.RowIndex.ToString();//为每个操作对象设定行号信息。
                LinkButton lb2 = (LinkButton)e.Row.FindControl("lb2");
                lb2.CommandArgument = e.Row.RowIndex.ToString();
                LinkButton lb3 = (LinkButton)e.Row.FindControl("lb3");
                lb3.CommandArgument = e.Row.RowIndex.ToString();
            }
        }

        protected void grdadmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowindex = int.Parse(e.CommandArgument.ToString());//获取操作行的行号
            string Id = grdadmin.DataKeys[rowindex].Value.ToString();//获取操作行数据的主键Id
            DALadmin_user dal = new DALadmin_user();//定义针对admin_user表的操作对象

            switch (e.CommandName)//获取操作对象的命令
            {
                case "edit"://调转到编辑页面
                    Response.Redirect("AdminEdit.aspx?id=" + Id);
                    break;
                case "del"://删除用户
                    dal.Deladmin_user(int.Parse(Id));
                    LoadData();//重新加载数据，验证是否成功删除
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('数据删除成功！');location.href='AdminList.aspx';</script>");
                    break;
                case "reset"://修改密码
                    admin_userEntity admin = dal.Getadmin_user(int.Parse(Id));
                    admin.UserPassword = "123456";
                    dal.Modadmin_user(admin);
                    LoadData();//重新加载数据，验证是否重置
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('用户密码重置成功，新密码123456');location.href='AdminList.aspx';</script>");
                    break;
            }
        }
        protected void btnselect_Click(object sender, EventArgs e)
        {
            LoadData();
        }

        protected void btnout_Click(object sender, EventArgs e)
        {
            this.grdadmin.Columns[4].Visible = false;
            Response.Clear();
            Response.AddHeader("content-disposition",
            "attachment;filename=管理员列表.xls");
            Response.Charset = "gb2312";
            Response.ContentEncoding = System.Text.Encoding.Default;
            Response.ContentType = "application/vnd.xls";
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);
            grdadmin.AllowPaging = false;
            LoadData();
            grdadmin.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();
            grdadmin.AllowPaging = true;
            LoadData();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // Confirms that an HtmlForm control is rendered for
        }
    }
}