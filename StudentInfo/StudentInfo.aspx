<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Inherits="StudentInfo.StudentInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学生信息</title>
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
        <asp:Button ID="btnout" runat="server" CssClass="layui-btn" Text="导出数据" OnClick="btnout_Click"></asp:Button>
        <div class="layui-card-body " style="width:auto; left: -30px; top: 2px;">
            <asp:GridView ID="grdusers" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                CssClass="layui-table layui-form" PageSize="3" OnRowCommand="grdusers_RowCommand" OnRowCreated="grdusers_RowCreated" style="margin-right: 0">
                <Columns>
                    <asp:BoundField DataField="StudentId" HeaderText="学号" SortExpression="StudentId" />
                    <asp:BoundField DataField="StudentPassword" HeaderText="学生密码" SortExpression="StudentPassword" />
                    <asp:BoundField DataField="StudentName" HeaderText="姓名" SortExpression="StudentName" />
                    <asp:BoundField DataField="StudentSex" HeaderText="性别" SortExpression="StudentSex" />
                    <asp:BoundField DataField="StudentNation" HeaderText="民族" SortExpression="StudentNation" />
                    <asp:BoundField DataField="StudentTelehpone" HeaderText="联系方式" SortExpression="StudentTelehpone" />
                    <asp:BoundField DataField="StudentQQ" HeaderText="QQ" SortExpression="StudentQQ" />
                    <asp:BoundField DataField="StudentClass" HeaderText="班级" SortExpression="StudentClass" />
                    <asp:BoundField DataField="StudentDormitory" HeaderText="宿舍号" SortExpression="StudentDormitory" />
                    <asp:BoundField DataField="StudentAddress" HeaderText="住址" SortExpression="StudentAddress" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="lb1" CommandName="edit" runat="server">编辑</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Sqladmin" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB %>" SelectCommand="SELECT * FROM [student_info] WHERE ([StudentName] = @StudentName)"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
