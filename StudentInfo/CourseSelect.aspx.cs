using System;
using SQLDAL;
using Model;

namespace StudentInfo
{
    public partial class CourseSelect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSelect_Click(object sender, EventArgs e)
        {
            DALstudent_course dal = new DALstudent_course();
            student_courseEntity course = new student_courseEntity();
            course.CourseId = lbx1.SelectedValue;
            course.StudentId = Session["uName"].ToString();
            dal.Addstudent_course(course);
            Response.Write("<script>alert('添加成功');location.href='CourseSelect.aspx';</script>");
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            DALstudent_course dal = new DALstudent_course();
            student_courseEntity course = new student_courseEntity();
            dal.Delstudent_course(int.Parse(lbx2.SelectedValue));
            Response.Write("<script>alert('放弃成功');location.href='CourseSelect.aspx'</script>");
        }
    }
}