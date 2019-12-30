using System;
using Model;
using SQLDAL;
using System.Web.UI.WebControls;

namespace StudentInfo
{
    public partial class NewsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void grdnews_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb1 = (LinkButton)e.Row.FindControl("lb1");
                lb1.CommandArgument = e.Row.RowIndex.ToString();//为每个操作对象设定行号信息。
            }
        }

        protected void grdnews_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int rowindex = int.Parse(e.CommandArgument.ToString());//获取操作行的行号
            string Id = grdnews.DataKeys[rowindex].Value.ToString();//获取操作行数据的主键Id
            DALnew dal = new DALnew();
            switch (e.CommandName)//获取操作对象的命令
            {
                case "see"://调转到编辑页面
                    Response.Redirect("NewsShow.aspx?id=" + Id);
                    break;
            }
        }
    }
}