using System;
namespace Model
{
    #region student_courseEntity
    /// <summary>
    /// Entity:student_courseEntity
    /// Author:NetCenter
    /// DateTime:2019/12/24 10:11:10
    /// </summary>
    [Serializable]
    public class student_courseEntity
    {
        #region Member Variables
        protected int _id;
        protected int _studentId;
        protected string _courseId = String.Empty;
        protected decimal _courseScore;
        #endregion
        #region Constructer without paras
        public student_courseEntity()
        {
        }
        #endregion
        #region Constructer with paras
        /// <summary>
        /// Constructer with paras
        /// </summary>
        /// <param name="id"></param>
        /// <param name="studentId"></param>
        /// <param name="courseId"></param>
        /// <param name="courseScore"></param>
        public student_courseEntity(
        int id,
        int studentId,
        string courseId,
        decimal courseScore)
        {
            this._id = id;
            this._studentId = studentId;
            this._courseId = courseId;
            this._courseScore = courseScore;
        }
        #endregion
        #region Public Properties
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public int StudentId
        {
            get { return _studentId; }
            set { _studentId = value; }
        }

        public string CourseId
        {
            get { return _courseId; }
            set { _courseId = value; }
        }

        public decimal CourseScore
        {
            get { return _courseScore; }
            set { _courseScore = value; }
        }
        #endregion
    }
    #endregion
}
