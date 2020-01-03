using System;
using Model;
using SQLDAL;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace StudentInfo
{
    public partial class CourseScore : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCourse();
                Button1.Visible = false;
            }
        }
        /// <summary>
        /// 加载已有的课程        /// 
        /// </summary>
        public void BindCourse()
        {
            DropDownList1.Items.Clear();//避免重复加载
            DALcourse dal = new DALcourse();
            IList<courseEntity> courses = dal.Getcourses();
            DropDownList1.DataSource = courses;
            DropDownList1.DataTextField = "CourseName";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("请选择课程", "0"));
        }
        /// <summary>
        /// 根据选择的课程，加载选修该课程的学生信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DALstudent_course dal = new DALstudent_course();
            IList<student_courseEntity> scs = dal.Getstudent_coursesbyCondition("CourseId='" + DropDownList1.SelectedValue + "'");
            GridView1.DataSource = scs;
            GridView1.DataBind();
            if (scs.Count > 0)
            {
                Button1.Visible = true;
            }
            else
            {
                Button1.Visible = false;
            }
        }
        /// <summary>
        /// 当行数据绑定的时候，进行必要的翻译处理
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //翻译课程
                DALcourse dalc = new DALcourse();
                courseEntity c = dalc.Getcourse(int.Parse(e.Row.Cells[1].Text));
                if (c != null)//判断是否有值
                {
                    e.Row.Cells[1].Text = c.CourseName; //有值才能使用
                }
                //else
                //{
                //    Response.Write("<script>alert('kongde');</script>");
                //}

                //翻译学生
                DALstudent_info dals = new DALstudent_info();
                IList<student_infoEntity> ss = dals.Getstudent_infosbyCondition("studentId='" + e.Row.Cells[0].Text + "'");
                if (ss.Count > 0)
                {
                    e.Row.Cells[0].Text = ss[0].StudentId;
                }
            }
        }
        /// <summary>
        /// 保存成绩
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            DALstudent_course dal = new DALstudent_course();
            foreach (GridViewRow gvr in GridView1.Rows)
            {
                TextBox tb = (TextBox)gvr.FindControl("fs");
                int id = int.Parse(GridView1.DataKeys[gvr.RowIndex].Value.ToString());
                student_courseEntity sc = dal.Getstudent_course(id);
                if (sc != null)
                {
                    sc.CourseScore = decimal.Parse(tb.Text);
                }
                dal.Modstudent_course(sc);
            }
        }
    }
}