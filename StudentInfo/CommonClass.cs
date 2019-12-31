using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace StudentInfo
{
    public class CommonClass
    {
        /// <summary>
        /// 输出查询结果，能够翻译所有的字段，但是不包含格式
        /// </summary>
        /// <param name="table">保存输出的数据</param>
        /// <param name="FieldName">输出的字段中文名</param>
        /// <param name="title">保存输出的标题字段</param>
        /// <returns></returns>
        public static bool ExportToExcel_NoFormat(System.Data.DataTable table, string[] FieldName, string title)
        {
            HttpServerUtility _server = HttpContext.Current.Server;
            string TemplateFiletop = _server.MapPath("~\\Model\\top.txt");
            string TemplateFileend = _server.MapPath("~\\Model\\end.txt");
            StringBuilder str = new StringBuilder();

            try
            {
                StreamReader sr = new StreamReader(TemplateFiletop, Encoding.GetEncoding("GB2312"));
                str.Append(sr.ReadToEnd());
                sr.Dispose();
                sr.Close();
            }
            catch
            {
                return false;
            }
            //输出标题

            str.Append("<Row ss:AutoFitHeight=\"0\">\r\n");
            str.Append("<Cell ss:StyleID=\"s75\"><Data ss:Type=\"String\">");
            str.Append(title);
            str.Append("</Data></Cell>\r\n");
            for (int i = 1; i < FieldName.Length; i++)
            {
                str.Append("<Cell ss:StyleID=\"s76\"/>\r\n");
            }
            str.Append("</Row>\r\n");

            //输出列字段
            str.Append("<Row ss:AutoFitHeight=\"0\">\r\n");
            foreach (string Field in FieldName)
            {
                str.Append("<Cell ss:StyleID=\"s62\"><Data ss:Type=\"String\">");
                str.Append(Field);
                str.Append("</Data></Cell>\r\n");
            }
            str.Append("</Row>\r\n");
            //输出行记录
            foreach (DataRow row in table.Rows)
            {
                int i = 0;
                str.Append("<Row ss:AutoFitHeight=\"0\">\r\n");
                foreach (DataColumn col in table.Columns)
                {
                    i++;
                    if (i > FieldName.Length)
                        break;
                    str.Append("<Cell ss:StyleID=\"s62\"><Data ss:Type=\"String\">" + (string.IsNullOrEmpty(row[col.ColumnName].ToString()) ? " " : row[col.ColumnName].ToString()) + "</Data></Cell>\r\n");
                }
                str.Append("</Row>\r\n");
            }
            try
            {
                StreamReader sr = new StreamReader(TemplateFileend, Encoding.GetEncoding("GB2312"));
                str.Append(sr.ReadToEnd());
                sr.Dispose();
                sr.Close();
            }
            catch
            {
                return false;
            }
            //替换输出的列数和行数
            str.Replace("ss:ExpandedColumnCount=\"5\"", "ss:ExpandedColumnCount=\"" + FieldName.Length + "\"");
            str.Replace("ss:ExpandedRowCount=\"2\"", "ss:ExpandedRowCount=\"" + (table.Rows.Count + 20) + "\"");
            //输出文档
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=DataList.xls");
            HttpContext.Current.Response.ContentType = "application/excel";
            HttpContext.Current.Response.Write(str);
            HttpContext.Current.Response.End();
            return true;
        }
        }
}