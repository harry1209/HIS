<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Medicineview.aspx.cs" Inherits="Recordview" %>

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
    <title>HIS---IT</title>
    <style type="text/css">
        .style1
        {
            width: 220px;
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
    <form id="form1" runat="server">

                        <br />
    <center>
        <div>
            <table>
                <tr>
                    <td>

                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Medicine Detail"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <table>
                            <tr>
                                <td colspan="3" style="font-family: Miriam; color: #FFFFFF">
                                    Edit Medicine Information：
                                    </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="Label4" runat="server" Text="Medicine ID：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="*" ControlToValidate="mid" ValidationGroup="3"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:TextBox ID="mid" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="Label2" runat="server" Text="Medicine Name：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="*" ControlToValidate="xingming" ValidationGroup="3"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:TextBox ID="xingming" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="Label3" runat="server" Text="Medicine Type：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ErrorMessage="*" ControlToValidate="mtype" ValidationGroup="3"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:DropDownList ID="DropDownList4" runat="server" Visible="False" DataSourceID="SqlDataSource1"
                                        DataTextField="MedicinetypeName" DataValueField="MedicinetypeName">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="mtype" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                           
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="Label5" runat="server" Text="Medicine Price：" Font-Names="Miriam" 
                                        ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ErrorMessage="*" ControlToValidate="mp" ValidationGroup="3"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style2" colspan="2">
                                    <asp:TextBox ID="mp" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>


                            <tr>
                                <td class="style1" align="center">
                                    <asp:Button ID="xiugai" runat="server" Text="Modify" OnClick="xiugai_Click" />
                                    <asp:Button ID="tijiao" runat="server" Text="Update" OnClick="tijiao_Click"
                                        Visible="False" ValidationGroup="3"/>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="shanchu" runat="server" Text="Delete" OnClick="shanchu_Click" OnClientClick="{if(confirm('Are you sure to delete？')){return true;}return false;}" />
                                </td>
                                <td class="style2" id="rs1" align="center">
                                    <%--<img id="Reset" alt="" height="26" onclick="empty()" src="../images/cz.gif" style="cursor: hand"
                                        width="64" />--%>
                                    <asp:ImageButton ID="ImageButton1" alt="" runat="server" src="../images/cz.gif" OnClick="ImageButton1_Click"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="Medicinemanagement.aspx" target="main" 
                                        style="font-family: Miriam; color: #FFFFFF">Back Record Management Page</a>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_HospitalConnectionString %>" SelectCommand="SELECT * FROM [Medicinetype_Information]"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>

                        <asp:TextBox ID="md" runat="server" Height="311px" ReadOnly="true" TextMode="MultiLine" Width="581px" Wrap="true"></asp:TextBox>
                    </td>
                </tr>

            </table>
        </div>
    </center>
    </form>
</body>
</html>
