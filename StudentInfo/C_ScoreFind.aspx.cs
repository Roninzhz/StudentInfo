using System;
using System.Collections.Generic;
using Model;
using SQLDAL;
namespace StudentInfo
{
    public partial class CourseFind : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnselect_Click(object sender, EventArgs e)
        {
            LoadData();
        }
        public void LoadData()
        {
            string conditon = string.Empty;
            conditon = "(StudentId is not null and StudentId<>' ')";
            if (!string.IsNullOrEmpty(ddlsource.SelectedValue))
            {
                conditon += " and CourseId='" + ddlsource.SelectedValue + "' and StudentId='" + Session["name"] + "'";
            }
            DALstudent_course dal = new DALstudent_course();
            IList<student_courseEntity> Course = dal.Getstudent_coursesbyCondition(conditon);
            GridView1.DataSource = Course;
            GridView1.DataBind();
        }
    }
}