using Model;
using SQLDAL;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentInfo
{
    public partial class CourseList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnout_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.AddHeader("content-disposition",
            "attachment;filename=我的课程表.xls");
            Response.Charset = "gb2312";
            Response.ContentEncoding = System.Text.Encoding.Default;
            Response.ContentType = "application/vnd.xls";
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);
            grdcourse_stu.AllowPaging = false;
            grdcourse_stu.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();
            grdcourse_stu.AllowPaging = true;
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }
    }
}