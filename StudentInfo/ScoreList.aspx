<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScoreList.aspx.cs" Inherits="StudentInfo.ScoreList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>成绩列表</title>
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
                    <form class="layui-form layui-col-space5" runat="server">
                        <div class="layui-card-body ">
                            <div class="layui-inline layui-show-xs-block">
                                &nbsp;
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <asp:Button ID="btnout" runat="server" CssClass="layui-btn" Text="导出数据" OnClick="btnout_Click"></asp:Button>
                            </div>
                        </div>
                        <div class="layui-card-body ">
                            <asp:GridView ID="grdscore" runat="server" AutoGenerateColumns="False" CssClass="layui-table layui-form" PageSize="3" DataSourceID="Sqlscore">
                                <Columns>
                                    <asp:BoundField DataField="StudentID" HeaderText="学号" SortExpression="StudentID" />
                                    <asp:BoundField DataField="CourseName" HeaderText="课程" SortExpression="CourseName" />
                                    <asp:BoundField DataField="CourseScore" HeaderText="分数" SortExpression="CourseScore" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="Sqlscore" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB %>" SelectCommand="select s.StudentId,c.CourseName,s.CourseScore from course c INNER join student_course s on s.CourseId=c.Id"></asp:SqlDataSource>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
