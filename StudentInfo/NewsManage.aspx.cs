using SQLDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace StudentInfo
{
    public partial class NewsManage1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdnews_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb1 = (LinkButton)e.Row.FindControl("lb1");
                lb1.CommandArgument = e.Row.RowIndex.ToString();//为每个操作对象设定行号信息。
                LinkButton lb2 = (LinkButton)e.Row.FindControl("lb2");
                lb2.CommandArgument = e.Row.RowIndex.ToString();
            }
        }

        protected void grdnews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowindex = int.Parse(e.CommandArgument.ToString());//获取操作行的行号
            string Id = grdnews.DataKeys[rowindex].Value.ToString();//获取操作行数据的主键Id
            DALnew dal = new DALnew();
            switch (e.CommandName)//获取操作对象的命令
            {
                case "edit"://调转到编辑页面
                    Response.Redirect("NewsEdit.aspx?id=" + Id);
                    break;
                case "del"://删除用户
                    dal.Delnews(int.Parse(Id));
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('数据删除成功！');location.href='NewsManage.aspx';</script>");
                    break;
            }
        }
    }
}