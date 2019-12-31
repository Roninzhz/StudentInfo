<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseSelect.aspx.cs" Inherits="StudentInfo.CourseSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
            height: 150px;
        }
        .auto-style2 {
            width: 161px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td rowspan="5">
                        <asp:ListBox ID="lbx1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseName" DataValueField="CourseId"></asp:ListBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td rowspan="5">
                        <asp:ListBox ID="lbx2" runat="server" DataSourceID="SqlDataSource2" DataTextField="CourseName" DataValueField="Id"></asp:ListBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnSelect" runat="server" Text="选择" OnClick="btnSelect_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnDel" runat="server" Text="放弃" OnClick="btnDel_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB %>" SelectCommand="SELECT [CourseName], [CourseId] FROM [course]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB %>"
            SelectCommand="select s.StudentId,s.CourseId,s.Id,c.CourseName from course c join student_course s on s.CourseId=c.CourseId;"></asp:SqlDataSource>
    </form>
</body>
</html>
