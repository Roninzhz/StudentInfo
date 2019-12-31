<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="StudentInfo.index" %>

<!DOCTYPE html  class="x-admin-sm">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学生信息教务管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
    <link rel="stylesheet" href="./css/theme5.css" />
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script>
        //是否开启刷新记忆tab功能
        var is_remember = true;
    </script>
</head>
<body>
    <form id="form1" runat="server" class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="./index.html">学生信息教务管理</a>
            </div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav left fast-add">
                <li class="layui-nav-item">
                    <a href="javascript:;">+新增</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('最大化','http://www.baidu.com','','',true)">
                                <i class="iconfont">&#xe6a2;</i>弹出最大化</a>
                        </dd>
                        <dd>
                            <a onclick="xadmin.open('弹出自动宽高','http://www.baidu.com')">
                                <i class="iconfont">&#xe6a8;</i>弹出自动宽高</a>
                        </dd>
                        <dd>
                            <a onclick="xadmin.open('弹出指定宽高','http://www.baidu.com',500,300)">
                                <i class="iconfont">&#xe6a8;</i>弹出指定宽高</a>
                        </dd>
                        <dd>
                            <a onclick="xadmin.add_tab('在tab打开','index.aspx')">
                                <i class="iconfont">&#xe6b8;</i>在tab打开</a>
                        </dd>
                        <dd>
                            <a onclick="xadmin.add_tab('在tab打开刷新','member-del.html',true)">
                                <i class="iconfont">&#xe6b8;</i>在tab打开刷新</a>
                        </dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav right">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <asp:Label ID="ltCurUser" runat="server"></asp:Label></a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('个人信息','http://www.baidu.com')">个人信息</a></dd>
                        <%--<dd>
                            <a onclick="xadmin.open('切换帐号','Login.aspx')">切换帐号</a></dd>
                        <dd>
                            <a onclick="xadmin.add_tab('切换帐号','Login.aspx')">切换帐号</a></dd>--%>
                        <dd>
                            <a href="Login.aspx">退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item to-index">
                    <a href="/">前台首页</a></li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li">&#xe6b8;</i>
                            <cite>公告</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <%--二级列表--%>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe70b;</i>
                            <cite>学生管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('学生信息录入','StudentAdd.aspx')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>学生信息录入</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('学生信息查看','StudentFind.aspx')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>学生信息查看</cite></a>
                            </li>
                             <li>
                                <a onclick="xadmin.add_tab('学生成绩录入','CourseScore.aspx')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>学生成绩录入</cite></a>
                            </li>
                             <li>
                                <a onclick="xadmin.add_tab('学生成绩列表','ScoreList.aspx')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>学生成绩列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li">&#xe723;</i>
                            <cite>课程管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('添加课程','CourseAdd.aspx')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>添加课程</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('课程信息查看','CourseList.aspx')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>课程信息查看</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li">&#xe723;</i>
                            <cite>通知管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('新闻列表','NewsList.aspx')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>新闻列表</cite></a>
                            </li>
                        </ul>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('新闻编写','NewsManage.aspx')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>新闻编写</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li">&#xe726;</i>
                            <cite>信息维护</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('管理员列表','AdminList.aspx')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>管理员列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('管理员添加','AdminAdd.aspx')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>管理员添加</cite></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li>
                </ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd>
                    </dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <%--<iframe src='./welcome.html' frameborder="0" scrolling="yes" class="x-iframe"></iframe>--%>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
    </form>
</body>
</html>

