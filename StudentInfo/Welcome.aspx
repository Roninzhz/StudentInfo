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
    <form id="form1" runat="server">
    <div class="layui-fluid">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body ">
                        <asp:Chart ID="Chart1" runat="server">
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
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
