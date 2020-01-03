<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseScore.aspx.cs" Inherits="StudentInfo.CourseScore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>成绩录入</title>
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
        <div class="layui-card-body " style="width: auto; top: 5px;">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="40px"></asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" CssClass="layui-table layui-form" DataKeyNames="Id" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="姓名" DataField="StudentId" />
                    <asp:BoundField HeaderText="课程" DataField="CourseId" />
                    <asp:TemplateField HeaderText="录入成绩">
                        <ItemTemplate>
                            <asp:TextBox ID="fs" runat="server" Width="60px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="Button1" CssClass="layui-btn" runat="server" Text="提交保存" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
