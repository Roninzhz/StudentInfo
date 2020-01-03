<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_ScoreFind.aspx.cs" Inherits="StudentInfo.CourseFind" %>

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
            <%--<a href="#">首页</a>
            <a href="#">演示</a>
            <a>
                <cite>导航元素</cite></a>--%>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height: 1.6em; margin-top: 3px; float: right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height: 30px"></i></a>
    </div>
    <div class="layui-fluid">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                   <%-- <div class="layui-card-header">
                        <button class="layui-btn" onclick="xadmin.open('添加学生','StudentAdd.aspx',800,600)"><i class="layui-icon"></i>添加</button>
                    </div>--%>
                    <form runat="server">
                         <asp:DropDownList ID="ddlsource" runat="server" DataSourceID="sqlcourse" DataTextField="CourseName" DataValueField="CourseId" Height="32px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="Sqlcourse" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB %>" SelectCommand="select s.StudentId,s.CourseId,s.Id,c.CourseName,s.CourseScore from course c join student_course s on s.CourseId=c.Id"></asp:SqlDataSource>
                        <%--<div class="layui-card-body ">--%>
                            <div class="layui-inline layui-show-xs-block">
                                 
                    
                               <%-- <input type="text" name="username" placeholder="请输入要查找的账户" class="layui-input" id="select" runat="server" />--%>
                            <%--</div>--%>
                            <div class="layui-inline layui-show-xs-block">
                                <asp:Button ID="btnselect" runat="server" CssClass="layui-btn" Text="查询成绩" OnClick="btnselect_Click"></asp:Button>
                                <%--<asp:Button ID="btnout" runat="server" CssClass="layui-btn" Text="导出数据" OnClick="btnout_Click"></asp:Button>--%>
                            </div>
                        </div> 
                        <div class="layui-card-body ">
                            <asp:GridView ID="grdcourse" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                                CssClass="layui-table layui-form" PageSize="3" style="margin-top: 8px"  DataSourceID="Sqlcourseinfo" DataTextField="CourseName" DataValueField="CourseId">
                                <Columns>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="Sqlcourseinfo" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB %>" SelectCommand="select s.StudentId,s.CourseId,s.Id,c.CourseName,s.CourseScore from course c join student_course s on s.CourseId=c.Id"></asp:SqlDataSource>
                        </div>
                        <div class="layui-card-body ">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  CssClass="layui-table layui-form">
                            <Columns>
                                <asp:BoundField DataField="CourseScore" HeaderText="该课程成绩为：" SortExpression="CourseScore" />
                            </Columns>
                        </asp:GridView>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
