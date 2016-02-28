<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Recordview.aspx.cs" Inherits="Recordview" %>

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
    <title>HIS---Doctor</title>
    <style type="text/css">
        .style1 {
            width: 200px;
            height: 23px;
        }

        .style2 {
            width: 100px;
            height: 23px;
        }

        .style3 {
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
                        <td></td>
                        <td>
                                        <asp:Label ID="Label8" runat="server" Text="Record Detail：" Font-Names="Miriam"
                                            ForeColor="White"></asp:Label>
                                    </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <table>

                                <tr>
                                    <td colspan="3" style="font-family: Miriam; color: #FFFFFF">Edit Record Information：
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="Label4" runat="server" Text="Patient ID：" Font-Names="Miriam"
                                            ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="*" ControlToValidate="xuehao" ValidationGroup="3"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style2" colspan="2">
                                        <asp:TextBox ID="xuehao" runat="server" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="Label9" runat="server" Text="Doctor ID：" Font-Names="Miriam"
                                            ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="*" ControlToValidate="rid" ValidationGroup="3"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style2" colspan="2">
                                        <asp:TextBox ID="did" runat="server" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="Label1" runat="server" Text="Record ID：" Font-Names="Miriam"
                                            ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="*" ControlToValidate="rid" ValidationGroup="3"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style2" colspan="2">
                                        <asp:TextBox ID="rid" runat="server" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="Label2" runat="server" Text="Name：" Font-Names="Miriam"
                                            ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ErrorMessage="*" ControlToValidate="xingming" ValidationGroup="3"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style2" colspan="2">
                                        <asp:TextBox ID="xingming" runat="server" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="Label3" runat="server" Text="Gender：" Font-Names="Miriam"
                                            ForeColor="White"></asp:Label>
                                    </td>
                                    <td class="style2" colspan="2">
                                        <asp:TextBox ID="xingbie" runat="server" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="Label5" runat="server" Text="Email：" Font-Names="Miriam"
                                            ForeColor="White"></asp:Label>
                                    </td>
                                    <td class="style2" colspan="2">
                                        <asp:TextBox ID="youxiang" runat="server" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="Label6" runat="server" Text="Address：" Font-Names="Miriam"
                                            ForeColor="White"></asp:Label>
                                    </td>
                                    <td class="style2" colspan="2">
                                        <asp:TextBox ID="dizhi" runat="server" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
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
                                        <asp:Button ID="tijiao" runat="server" Text="Update" OnClick="tijiao_Click"
                                            Visible="False"  ValidationGroup="3"/>
                                    </td>
                                    <td class="style2" id="rs1" align="center">
                                        <asp:ImageButton ID="ImageButton1" alt="" runat="server" src="../images/cz.gif" OnClick="ImageButton1_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <a href="Patientrecordmanagement.aspx" target="main"
                                            style="font-family: Miriam; color: #FFFFFF">Return to Record Management Page</a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <asp:TextBox ID="liuyan" runat="server" Height="311px" ReadOnly="true" TextMode="MultiLine" Width="581px" Wrap="true"></asp:TextBox>
                        </td>
                    </tr>

                </table>
            </div>
        </center>
    </form>
</body>
</html>
