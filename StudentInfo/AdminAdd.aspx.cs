using Model;
using SQLDAL;
using System;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Text;

namespace StudentInfo
{
    public partial class AdminAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            DALadmin_user dal = new DALadmin_user();
            admin_userEntity admin = new admin_userEntity();
            admin.UserName = username.Value;
            admin.UserPassword = L_pass.Value;
            admin.LoginTimes = 1;
            admin.LinkTelephone = phone.Value;
            dal.Addadmin_user(admin);
            ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('添加成功');location.href='AdminAdd.aspx';</script>");
        }

        protected void btnin_Click(object sender, EventArgs e)
        {
            if (Filadmin.HasFile)
            {
                int startPosition = Filadmin.FileName.LastIndexOf(".");//获取后缀名的起始位置
                string extName = Filadmin.FileName.Substring(startPosition).ToLower();//获取后缀名
                if (startPosition >= 0)
                {
                    if (extName.Equals(".xlsx") || extName.Equals(".xls"))
                    {
                        string path = Server.MapPath("./File/");
                        if (!Directory.Exists(path))
                        {
                            Directory.CreateDirectory(path);
                        }
                        string saveFile = path + DateTime.Now.ToString("yyyyMMddHHmmss") + extName;
                        Filadmin.SaveAs(saveFile);//上传文件到指定位置

                        OleDbConnection oledbconn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " + saveFile + ";Persist Security Info=False;Extended Properties='Excel 8.0;HDR=Yes;IMEX=1'");
                        //新建ole命令对象
                        oledbconn.Open();
                        ///因为需要在运行的过程中，增加数据列，并对数据进行修正。
                        ///所以，需要首先读入数据进入内存datatable中然后进行操作。
                        OleDbCommand commandSourceData = new OleDbCommand("SELECT * FROM [Sheet1$]", oledbconn);
                        OleDbDataAdapter oleda = new OleDbDataAdapter();
                        oleda.SelectCommand = commandSourceData;
                        DataTable tb = new DataTable();
                        oleda.Fill(tb);
                        oledbconn.Close();
                        //数据规整部分。
                        int successNumber = 0;
                        int failureNumber = 0;
                        //数据处理
                        StringBuilder resultsb = new StringBuilder();
                        DALadmin_user dal = new DALadmin_user();
                        foreach (DataRow dr in tb.Rows)
                        {
                            try
                            {
                                //取值
                                string yh = dr["yh"].ToString().Trim();
                                string mm = dr["mm"].ToString().Trim();
                                string xm = dr["xm"].ToString().Trim();
                                string cs = dr["cs"].ToString().Trim();
                                string dh = dr["dh"].ToString().Trim();
                                admin_userEntity admin = new admin_userEntity();
                                //赋值
                                admin.LinkTelephone = dh;
                                admin.LoginTimes = int.Parse(cs);
                                admin.TrueName = xm;
                                admin.UserName = yh;
                                admin.UserPassword = mm;
                                dal.Addadmin_user(admin);//添加
                                successNumber++;
                            }
                            catch (Exception Error)
                            {
                                resultsb.Append(dr["xh"].ToString().Trim());
                                resultsb.Append("导入失败；原因：");
                                resultsb.Append(Error.Message);
                                resultsb.Append("\r\n");
                                failureNumber++;
                            }
                        }//endforeach
                        resultsb.Insert(0, successNumber + " 条信息成功导入！\r\n" + failureNumber + "条信息无法导入！\r\n");
                        lb1.Text = "<div class=\"valid_box\">" + resultsb.ToString() + "</div>";
                    }
                    else
                    {
                        lb1.Text = "<font color='red'>选定的文件不是合法的Excel文件！</font>";
                    }
                }
            }
            else
            {
                lb1.Text = "<font color='red'>没有选定要导入的文件！</font>";
            }
        }
    }
}