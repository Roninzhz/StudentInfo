<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseAdd.aspx.cs" Inherits="StudentInfo.CourseAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加课程</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>
<body>
    <div class="layui-fluid">
        <div class="layui-row">
            <form class="layui-form" runat="server">
                <div class="layui-form-item">
                    <label for="username" class="layui-form-label">
                        <span class="x-red">*</span>课程编号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="CourseId" lay-verify="required"
                            autocomplete="off" class="layui-input" runat="server" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="username" class="layui-form-label">
                        <span class="x-red">*</span>课程名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="CourseName" lay-verify="required"
                            autocomplete="off" class="layui-input" runat="server" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="username" class="layui-form-label">
                        <span class="x-red">*</span>任课教师
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="Teacher" lay-verify="required"
                            autocomplete="off" class="layui-input" runat="server" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="username" class="layui-form-label">
                        <span class="x-red">*</span>课程详情
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="Info" lay-verify="required"
                            autocomplete="off" class="layui-input" runat="server" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="username" class="layui-form-label">
                        <span class="x-red">*</span>限报人数
                    </label>
                    <div class="layui-input-inline">
                        <input type="number" id="Num" lay-verify="required"
                            autocomplete="off" class="layui-input" runat="server" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <asp:Button ID="btnsave" runat="server" Text="添加" CssClass="layui-btn" OnClick="btnsave_Click" />
                </div>
            </form>
        </div>
    </div>
</body>

</html>
