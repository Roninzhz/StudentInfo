<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="StudentInfo.Welcome" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <title>个人成绩信息概况</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
</head>

<body>
     <div class="x-nav">
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
                                <input type="text" name="username" class="layui-input" id="select" runat="server" readonly="readonly"/>
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <asp:Button ID="btnselect" runat="server" CssClass="layui-btn" Text="查看" OnClick="btnselect_Click"></asp:Button>
                            </div>
                        </div>
                        <div class="layui-card-body ">
                            <asp:Chart ID="Chart1" runat="server" Height="362px" Width="471px">
                            <Titles>
                                <asp:Title Font="微软雅黑, 16pt" Name="Title1" Text="个人情况统计表">
                                </asp:Title>
                            </Titles>
                            <BorderSkin SkinStyle="Emboss"></BorderSkin>

                            <Series>
                                <asp:Series Name="Series1" ChartType="Line" MarkerSize="8" MarkerStyle="Circle">
                                </asp:Series>

                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BackSecondaryColor="Transparent" BackColor="64, 165, 191, 228" ShadowColor="Transparent" BackGradientStyle="TopBottom">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
