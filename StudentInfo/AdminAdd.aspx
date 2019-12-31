<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAdd.aspx.cs" Inherits="StudentInfo.AdminAdd" %>

<!DOCTYPE html class="x-admin-sm">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理添加</title>
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
                        <span class="x-red">*</span>登录名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="username" name="username" lay-verify="required"
                            autocomplete="off" class="layui-input" runat="server">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>将会成为您唯一的登入名
                    </div>
                </div>
                   <div class="layui-form-item">
                    <label for="L_pass" class="layui-form-label">
                        <span class="x-red">*</span>密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="L_pass" name="pass" lay-verify="pass"
                            autocomplete="off" class="layui-input" runat="server">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                        <span class="x-red">*</span>确认密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="L_repass" name="repass" lay-verify="repass"
                            autocomplete="off" class="layui-input" runat="server">
                    </div>
                    <asp:CompareValidator ID="Comparepass" runat="server" ErrorMessage="*两次密码输入不一致" ControlToValidate="L_pass" ControlToCompare="L_repass" ForeColor="#FF3300"></asp:CompareValidator>
                </div>
                <div class="layui-form-item">
                    <label for="phone" class="layui-form-label">
                        <span class="x-red">*</span>手机
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="phone" name="phone" lay-verify="phone"
                            autocomplete="off" class="layui-input" runat="server">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>将会成为您唯一修改凭证
                    </div>
                </div>
                 <div class="layui-form-item">
                      <label for="L_repass" class="layui-form-label">
                      </label>
                    <asp:Button ID="btnsave" runat="server" Text="添加" CssClass="layui-btn" OnClick="btnsave_Click" />
                      <br />
                      <asp:FileUpload ID="Filadmin" runat="server" />
                      <asp:Button ID="btnin" runat="server" Text="确认导入" OnClick="btnin_Click" />
                      <asp:Label ID="lb1" runat="server" Text=""></asp:Label>
                </div>
                
            </form>
        </div>
    </div>
</body>
</html>
