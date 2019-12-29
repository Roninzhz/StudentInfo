<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentFind.aspx.cs" Inherits="StudentInfo.StudentFind" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学生查找</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>
<body>
    <div class="x-nav">
        <span class="layui-breadcrumb">
            <a href="#">首页</a>
            <a href="#">演示</a>
            <a>
                <cite>导航元素</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height: 1.6em; margin-top: 3px; float: right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height: 30px"></i></a>
    </div>
    <div class="layui-fluid">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-header">
                        <button class="layui-btn" onclick="xadmin.open('添加学生','StudentAdd.aspx',800,600)"><i class="layui-icon"></i>添加</button>
                    </div>
                    <form class="layui-form layui-col-space5" runat="server">
                        <div class="layui-card-body ">
                            <div class="layui-inline layui-show-xs-block">
                                <input type="text" name="username" placeholder="请输入要查找的账户" class="layui-input" id="select" runat="server" />
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <asp:Button ID="btnselect" runat="server" CssClass="layui-btn" Text="查找" OnClick="btnselect_Click"></asp:Button>
                                <asp:Button ID="btnout" runat="server" CssClass="layui-btn" Text="导出数据" OnClick="btnout_Click"></asp:Button>
                            </div>
                        </div>
                        <div class="layui-card-body ">
                            <asp:GridView ID="grdusers" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                                CssClass="layui-table layui-form" PageSize="3" OnRowCommand="grdusers_RowCommand"
                                OnRowCreated="grdusers_RowCreated">
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
                                             <asp:LinkButton ID="lb1" CommandName="edit" runat="server">编辑</asp:LinkButton>||
                                             <asp:LinkButton ID="lb2" CommandName="del" runat="server" OnClientClick="javascript:return confirm('确定删除吗?');">删除</asp:LinkButton>||
                                             <asp:LinkButton ID="lb3" CommandName="reset" runat="server" ToolTip="重置当前用户的密码" OnClientClick="javascript:return confirm('确定重置当前用户的密码吗?');">重置</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>    
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="Sqladmin" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB %>" SelectCommand="SELECT * FROM [admin_user] WHERE ([UserName] = @UserName)"></asp:SqlDataSource>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
