<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserEditPwd.aspx.cs" Inherits="StudentInfo.UserEditPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>密码修改</title>
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
                        <span class="x-red">*</span>学生学号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="UserId" name="StudentId" lay-verify="required"
                            autocomplete="off" class="layui-input" runat="server" readonly="readonly" />
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_pass" class="layui-form-label">
                        <span class="x-red">*</span>旧密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="Password1" name="pass" lay-verify="pass"
                            autocomplete="off" class="layui-input" runat="server" />
                    </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_pass" class="layui-form-label">
                            <span class="x-red">*</span>新密码
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" id="L_pass" name="pass" lay-verify="pass"
                                autocomplete="off" class="layui-input" runat="server" />
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label">
                            <span class="x-red">*</span>确认密码
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" id="L_repass" name="repass" lay-verify="repass"
                                autocomplete="off" class="layui-input" runat="server" />
                        </div>
                        <asp:CompareValidator ID="Comparepass" runat="server" ErrorMessage="*两次密码输入不一致" ControlToValidate="L_pass" ControlToCompare="L_repass" ForeColor="#FF3300"></asp:CompareValidator>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label">
                        </label>
                    <asp:Button ID="btnedit" runat="server" CssClass="layui-btn" Text="修改" OnClick="btnedit_Click"></asp:Button>          
                    </div>
            </form>
        </div>
    </div>
</body>
</html>
