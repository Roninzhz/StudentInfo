<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentInfo.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="x-admin-sm">
<head runat="server">
    <meta charset="UTF-8" />
    <title>学生成绩管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/login.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <style type="text/css">
    </style>
    </head>
<body class="login-bg">
    <div class="login layui-anim layui-anim-up">
        <div class="message">用户登录</div>
        <div id="darkbannerwrap"></div>

        <form method="post" class="layui-form" runat="server">
            <input name="username" placeholder="用户名" type="text" lay-verify="required" class="layui-input" id="user_name" runat="server" />
            <hr class="hr15" />
            <input name="password" lay-verify="required" placeholder="密码" type="password" class="layui-input" id="pass_word" runat="server" />
            <hr class="hr15" />
            <input name="code" lay-verify="required" placeholder="验证码" class="layui-input" id="CheckCode" runat="server" style="width: 200px" />
            <div style="position: relative; left: 200px; top: -50px;">
                <asp:Image ID="Image" runat="server" ImageUrl="~/CheckCode.aspx" Width="100px" Height="40px" /><br />
                <br />
                <asp:Label ID="shuaxin" runat="server" Text="看不清，单击验证码换一张"></asp:Label>
            </div>
            <asp:Button ID="btnsubmit" runat="server" Text="教师登录" OnClick="btnsubmit_Click" Width="150px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnsubmit1" runat="server" Text="学生登录" Width="150px" OnClick="btnsubmit1_Click"/>
            <hr class="hr20" />
        </form>
        <button onclick="xadmin.open('快捷登录','quiet.aspx',700,500)" ><i></i>快捷登录</button>
    </div>
    <!-- 底部结束 -->
    <%--验证码--%>
    <script type="text/javascript">
        $("#Image").click(function () { 
            $(this).attr("src", "CheckCode.aspx?code=" + (new Date()).getTime());
        });
    </script>
</body>
</html>
