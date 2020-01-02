using System;
using SQLDAL;
using Model;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace StudentInfo
{
    public partial class CourseSelect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAllCourse();
                BindSelectCourese();
            }

        }
        /// <summary>
        /// 加载已选课程
        /// </summary>
        public void BindSelectCourese()
        {
            DALstudent_course dal = new DALstudent_course();
            IList<student_courseEntity> scs = dal.Getstudent_coursesbyCondition("StudentId='" + Session["uName"].ToString() + "'");
            if (scs.Count > 0)
            {
                Button1.Enabled = false;
                Button2.Enabled = false;
                Button3.Enabled = false;
                Button3.ToolTip = "您已经选过课程了，只能查看！";
                lb2.Items.Clear();//先清空，再绑定已选择的课程
                DALcourse dalc = new DALcourse();
                courseEntity c = new courseEntity();
                foreach (student_courseEntity sc in scs)
                {
                    c = dalc.Getcourse(int.Parse(sc.CourseId));//通过选课存储的课程号，到课程表中取出该课程的课程名称等信息
                    ListItem li = new ListItem(c.CourseName, c.Id.ToString());
                    lb2.Items.Add(li);
                }
            }
            else
            {
                Button1.Enabled = true;
                Button2.Enabled = true;
                Button3.Enabled = true;
            }
        }
        //加载所有课程
        public void BindAllCourse()
        {
            DALcourse dal = new DALcourse();
            IList<courseEntity> courses = dal.Getcourses();
            lb1.DataSource = courses;
            lb1.DataTextField = "CourseName";
            lb1.DataValueField = "Id";
            lb1.DataBind();
        }
        /// <summary>
        /// 单击课程的时候，加载给课程的详细信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lb1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DALcourse dal = new DALcourse();
            courseEntity course = dal.Getcourse(int.Parse(lb1.SelectedValue));
            Literal1.Text = "课程名称：" + course.CourseName + "；<br/>授课教师：" + course.CourseTeacher + "；<br/>课程简介：" + course.CourseInfo + "；<br/>限选人数：" + course.CourseStudentNum;
        }
        /// <summary>
        /// 选定课程
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            ListItem li = lb1.SelectedItem;
            //if (li.Selected==false)
            //{
            //    ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('无可操作项！');</script>");
            //}
            li.Selected = false;
            lb2.Items.Add(li);
            lb1.Items.Remove(li);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ListItem li = lb2.SelectedItem;
            li.Selected = false;
            lb2.Items.Remove(li);
            lb1.Items.Add(li);
        }
        /// <summary>
        /// 确认保存选课信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button3_Click(object sender, EventArgs e)
        {
            DALstudent_course dal = new DALstudent_course();
            student_courseEntity sc = new student_courseEntity();
            if (lb2.Items.Count == 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('无可操作项！');</script>");
            }
            else
            {
                foreach (ListItem li in lb2.Items)
                {
                    sc = new student_courseEntity();
                    sc.CourseId = li.Value;
                    sc.StudentId = Convert.ToInt32(Session["uName"]);
                    dal.Addstudent_course(sc);
                }
            }
        }
}
}