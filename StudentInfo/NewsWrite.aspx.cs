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
    public partial class NewsWrite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
                DALnew dal = new DALnew();
                newEntity news = new newEntity();
                news.Title = desc1.Value;
                news.Content = content.Value;
                news.Author = Session["name"].ToString();
                news.ReleaseTime = System.DateTime.Now;
                if (FileUpload1.HasFile)
                {
                    int startPosition = FileUpload1.FileName.LastIndexOf(".");
                    string extName = FileUpload1.FileName.Substring(startPosition).ToLower();
                    string path = Server.MapPath("./File/");
                    string fileName = DateTime.Now.ToString("yyyyMMddHHmmss") + extName;

                    string saveFile = path + fileName;
                    string showFile = "./File/" + fileName;

                    FileUpload1.SaveAs(saveFile);
                    news.RelateFile = showFile;

                }
                dal.Addnews(news);
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('新闻发布成功!');</script>");
        }
    }
}