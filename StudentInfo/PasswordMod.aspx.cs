using Model;
using SQLDAL;
using System;

namespace StudentInfo
{
    public partial class PasswordMod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetData(id);//获取数据
                }
            }
        }

        public void GetData(int id)
        {
            DALstudent_info dal = new DALstudent_info();
            student_infoEntity student = dal.Getstudent_info(id);
            ViewState["student"] = student;
            StudentId.Value = student.StudentId;
            //将取回的数据在页面进行展示，可以修改的数据使用TextBox来展示，并提供修改。
            //通过按钮触发，实现将数据编辑保存的功能
        }
        /// <summary>
        /// 保存修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        protected void btnedit_Click(object sender, EventArgs e)
        {
            DALstudent_info dal = new DALstudent_info();
            student_infoEntity student = (student_infoEntity)ViewState["student"];//获取缓存
            if (student.StudentPassword == Password1.Value)
            {
                student.StudentPassword = L_pass.Value;//修改数据
                dal.Modstudent_info(student);//提交到数据库
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('修改成功！');</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('修改失败，请检查密码正确性！');</script>");
            }
        }
    }
}