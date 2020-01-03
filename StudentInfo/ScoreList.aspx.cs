using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentInfo
{
    public partial class ScoreList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnout_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.AddHeader("content-disposition",
            "attachment;filename=成绩总表.xls");
            Response.Charset = "gb2312";
            Response.ContentEncoding = System.Text.Encoding.Default;
            Response.ContentType = "application/vnd.xls";
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);
            grdscore.AllowPaging = false;
            grdscore.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();
            grdscore.AllowPaging = true;
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // Confirms that an HtmlForm control is rendered for
        }
    }
}