using Model;
using SQLDAL;
using System;

namespace StudentInfo
{
    public partial class CourseAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            DALcourse dal = new DALcourse();
            courseEntity course = new courseEntity();
            course.CourseId = CourseId.Value;//课程编号
            course.CourseName = CourseName.Value;//课程名
            course.CourseInfo = Info.Value;//课程详情
            course.CourseTeacher = Teacher.Value;//任课教师
            course.CourseStudentNum = Convert.ToInt16(Num.Value);//限报人数
            dal.Addcourse(course);//调用添加课程方法添加课程
            //建议后续在添加之前先行查看表中是否含有该条数据，那就拜托张老板啦 加油 奥里给！！！
            ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('添加成功');</script>");
        }
    }
}