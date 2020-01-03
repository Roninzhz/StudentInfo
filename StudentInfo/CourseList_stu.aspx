<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseList_stu.aspx.cs" Inherits="StudentInfo.CourseList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选课信息</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="btnout" runat="server" Text="导出数据" CssClass="layui-btn" OnClick="btnout_Click"/>
        <div class="layui-card-body " style="width:auto; left: -30px; top: 2px;">
            <asp:GridView ID="grdcourse_stu" runat="server" AutoGenerateColumns="False"
                CssClass="layui-table layui-form" PageSize="3" style="margin-right: 0" DataSourceID="Sqlcourse_stu">
                <Columns>
                    <asp:BoundField DataField="CourseName" HeaderText="已选课程" SortExpression="CourseName" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Sqlcourse_stu" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB %>" SelectCommand="select c.CourseName from course c join student_course s on s.CourseId=c.Id WHERE ([StudentId] = @StudentId)">
                <SelectParameters>
                    <asp:SessionParameter Name="StudentId" SessionField="uName" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
