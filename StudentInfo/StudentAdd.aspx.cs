using Model;
using SQLDAL;
using System;

namespace StudentInfo
{
    public partial class StudentAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            DALstudent_info dal = new DALstudent_info();
            student_infoEntity student = new student_infoEntity();
            student.StudentAddress = jg.Value;
            student.StudentClass = Class.Value;
            student.StudentDormitory = ss.Value;
            student.StudentId = StudentId.Value;
            student.StudentName = truename.Value;
            student.StudentNation = nation.Value;
            student.StudentPassword = L_pass.Value;
            student.StudentQQ = QQ.Value;
            student.StudentSex = Sex.Value;
            student.StudentTelehpone = TEL.Value;
            dal.Addstudent_info(student);
            ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('添加成功');</script>");
        }
    }
}