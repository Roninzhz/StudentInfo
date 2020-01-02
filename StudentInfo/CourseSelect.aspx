<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseSelect.aspx.cs" Inherits="StudentInfo.CourseSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form runat="server">
        <table class="am-u-sm-12" style="width: 510px;">
            <tr style="text-align: center;">
                <td>未选课程</td>
                <td>操作</td>
                <td>已选课程</td>
            </tr>
            <tr style="text-align: center;">
                <td>
                    <asp:ListBox ID="lb1" runat="server" Height="460px" Width="210px" OnSelectedIndexChanged="lb1_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
                </td>
                <td style="width: 80px;">
                    <asp:Button ID="Button1" Height="35px" runat="server" Text="选定>>" OnClick="Button1_Click" /><br />
                    <br />
                    <asp:Button ID="Button2" Height="35px" runat="server" Text="退选<<" OnClick="Button2_Click" /><br />
                    <br />
                    <asp:Button ID="Button3" Height="35px" runat="server" Text="确认提交" OnClick="Button3_Click" /><br />
                </td>
                <td>
                    <asp:ListBox ID="lb2" runat="server" Height="460px" Width="210px"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
