<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Memberinfo.aspx.cs" Inherits="Memberinfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript">
    function empty() {
        form1.xuehao.value = "";
        form1.mima.value = "";
        form1.xingming.value = "";
        form1.youxiang.value = "";
        form1.dizhi.value = "";
        form1.lianxifangshi.value = "";
    }
</script>
<head runat="server">
    <title>HIS---Nurse</title>
    <style type="text/css">
        .style1
        {
            width: 200px;
            height: 23px;
        }
        .style2
        {
            width: 100px;
            height: 23px;
        }
        .style3
        {
            width: 444px;
        }
    </style>
    <link href="../table.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <br />
    <br />
    <br />
    <form id="form1" runat="server">
    <center>
        <div>
            <table>
                <tr>
                    <td class="style3">
                        <table>
                            <tr>
                                <td colspan="3" align="center" style="font-family: Miriam; color: #FFFFFF">
                                    Edit Personal Information：
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:db_hospitalConnectionString6 %>" 
                                        SelectCommand="SELECT [DepartmentName] FROM [Department_Information]">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                    <asp:Label ID="Label4" runat="server" Text="ID：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:TextBox ID="xuehao" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                    <asp:Label ID="Label1" runat="server" Text="Password：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ErrorMessage="*" ControlToValidate="mima" ValidationGroup="3"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:TextBox ID="mima" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                    <asp:Label ID="Label2" runat="server" Text="Name：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ErrorMessage="*" ControlToValidate="xingming" ValidationGroup="3"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:TextBox ID="xingming" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                    <asp:Label ID="Label3" runat="server" Text="Gender：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:DropDownList ID="DropDownList3" runat="server" Visible="False">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="xingbie" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                    <asp:Label ID="Label9" runat="server" Text="Department：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:DropDownList ID="DropDownList4" runat="server" Visible="False" DataSourceID="SqlDataSource1"
                                        DataTextField="DepartmentName" DataValueField="DepartmentName">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="banji" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                    <asp:Label ID="Label5" runat="server" Text="Email：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:TextBox ID="youxiang" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                    <asp:Label ID="Label6" runat="server" Text="Address：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:TextBox ID="dizhi" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                    <asp:Label ID="Label7" runat="server" Text="Tel：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:TextBox ID="lianxifangshi" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                    <asp:Button ID="xiugai" runat="server" Text="Modify" OnClick="xiugai_Click" />
                                    <asp:Button ID="tijiao" runat="server" Text="Update" OnClick="tijiao_Click" Style="height: 21px"
                                        Visible="False" ValidationGroup="3" />
                                    </td>
                                <td class="style2" id="rs1">
                                    <%--<img id="Reset" alt="" height="26" onclick="empty()" src="../images/cz.gif" style="cursor: hand"
                                        width="64" />--%>
                                    <asp:ImageButton ID="ImageButton1" alt="" runat="server" src="../images/cz.gif" OnClick="ImageButton1_Click"/>
                                </td>
                            </tr>
                        </table>
                    </td>

                </tr>
            </table>
        </div>
    </center>
    </form>
</body>
</html>
