<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsEdit.aspx.cs" Inherits="StudentInfo.NewsManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>新闻编辑</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>
<body>
    <div class="x-nav">
        <%--<span class="layui-breadcrumb">
            <a href="#">首页</a>
            <a href="#">演示</a>
            <a>
                <cite>导航元素</cite></a>--%>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height: 1.6em; margin-top: 3px; float: right" onclick="javascript:history.back(-1);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height: 30px"></i></a>
    </div>
    <div class="auto-style1">
        <div class="layui-row">
            <form method="post" class="layui-form layui-form-pane" runat="server">

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">
                        新闻标题
                    </label>
                    <table class="layui-table layui-input-block">
                        <tbody>
                            <tr>
                                <td>
                                    <div>
                                        <textarea placeholder="请输入标题" id="desc1" name="desc" class="layui-textarea" runat="server"></textarea>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label for="desc" class="layui-form-label">
                        新闻内容
                    </label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea" runat="server"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <asp:Button ID="submit" runat="server" Text="提交" CssClass="layui-btn" OnClick="submit_Click" />
                </div>
            </form>
        </div>
    </div>
</body>
</html>
