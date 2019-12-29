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
    public partial class StudentInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }
        public void LoadData()
        {
            string conditon = string.Empty;
            conditon = "(StudentId is not null and StudentId<>' ')";
            if (!string.IsNullOrEmpty(Session["uName"].ToString()))
            {
                conditon += " and StudentName='" + Session["uName"].ToString() + "'";
            }
            DALstudent_info dal = new DALstudent_info();
            IList<student_infoEntity> admins = dal.Getstudent_infosbyCondition(conditon);//按照条件来查询数据
            grdusers.DataSource = admins;
            grdusers.DataBind();
        }

        protected void grdusers_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb1 = (LinkButton)e.Row.FindControl("lb1");
                lb1.CommandArgument = e.Row.RowIndex.ToString();//为每个操作对象设定行号信息。
            }
        }

        protected void grdusers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowindex = int.Parse(e.CommandArgument.ToString());//获取操作行的行号
            string Id = grdusers.DataKeys[rowindex].Value.ToString();//获取操作行数据的主键Id
            DALadmin_user dal = new DALadmin_user();//定义针对admin_user表的操作对象

            switch (e.CommandName)//获取操作对象的命令
            {
                case "edit"://调转到编辑页面
                    Response.Redirect("PasswordMod.aspx?id=" + Id);
                    break;
            }
        }
        protected void btnout_Click(object sender, EventArgs e)
        {
            this.grdusers.Columns[10].Visible = false;
            Response.Clear();
            Response.AddHeader("content-disposition",
            "attachment;filename=个人信息列表.xls");
            Response.Charset = "gb2312";
            Response.ContentEncoding = System.Text.Encoding.Default;
            Response.ContentType = "application/vnd.xls";
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);
            grdusers.AllowPaging = false;
            LoadData();
            grdusers.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();
            grdusers.AllowPaging = true;
            LoadData();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // Confirms that an HtmlForm control is rendered for
        }
    }
}