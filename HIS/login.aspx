<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript">
    function empty() {
        form1.txtUsername.value = "";
        form1.txtUserpwd.value = "";

    }
</script>
<head id="Head1" runat="server">
    <title>Hospital Information System</title>
    <style type="text/css">
<!--
body {
	background-color: #d2d2d2;
}
    .style1
    {
        height: 43px;
        width: 150px;
    }
    -->
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <html>
        <head>
            <title>login</title>
            <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        </head>
        <body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
            <br />
            <br />
            <br />
            <table width="636" height="357" align="center" cellpadding="0" cellspacing="0" background="images/xk1.jpg">
                <tr>
                    <td width="636" height="357">
                        <table width="430" border="0" cellpadding="0" cellspacing="0" style="text-align: left">
                            <tr>
                                <td colspan="8">
                                    &nbsp;
                                </td>
                                <td style="width: 43px">
                                    <img src="images/spacer.gif" width="1" height="130" alt="" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" rowspan="4" style="width: 66px">
                                    &nbsp;
                                </td>
                                <td style="width: 12px">
                                    <img src="images/login_3.gif" width="1" height="1" alt="" />
                                </td>
                                <td colspan="3" rowspan="2" style="background-image: url()">
                                    <table style="font-size: 12px; width: 235px; height: 78px">
                                        <tr>
                                            <td style="width: 386px">
                                            </td>
                                            <td style="width: 109px">
                                            </td>
                                            <td style="width: 100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 22px; width: 386px; text-align: right;" align="left">
                                                UserID：
                                            </td>
                                            <td style="width: 109px; height: 22px">
                                                <asp:TextBox ID="txtUsername" runat="server" Height="15px" Width="130px"></asp:TextBox>
                                            </td>
                                            <td style="width: 10px; height: 22px">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername"
                                                    ErrorMessage="UserID cannot be empty!">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 23px; width: 386px; text-align: right;" align="left">
                                                Password：
                                            </td>
                                            <td style="width: 109px; height: 23px">
                                                <asp:TextBox ID="txtUserpwd" runat="server" Height="15px" TextMode="Password" Width="130px"></asp:TextBox>
                                            </td>
                                            <td style="width: 10px; height: 23px">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserpwd"
                                                    ErrorMessage="Password cannot be empty!">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                         <td style="height: 23px; width: 386px; text-align: right;" align="left">
                                             
                                            </td>
                                            <td style="width: 109px; height: 23px" colspan="3">
                                                
                                                    <%--<asp:DropDownList ID="rb1" runat="server" Height="16px" Font-Size="Medium" 
                                                        Width="130px">
                                                        <asp:ListItem Selected="True" Text="Doctor" Value="Doctor"></asp:ListItem>
                                                        <asp:ListItem Text="Patient" Value="Patient"></asp:ListItem>
                                                        <asp:ListItem Text="Nurse" Value="Nurse"></asp:ListItem>
                                                        <asp:ListItem Text="Lawyer" Value="Lawyer"></asp:ListItem>
                                                        <asp:ListItem Text="Financia Center" Value="Financia Center"></asp:ListItem>
                                                        <asp:ListItem Text="IT" Value="IT"></asp:ListItem>
                                                    </asp:DropDownList>--%>
                                               
                                            </td>

                                        </tr>
                                    </table>
                                </td>
                                <td rowspan="3" style="width: 38px">
                                    &nbsp;
                                </td>
                                <td style="width: 43px">
                                    <img src="images/spacer.gif" width="1" height="1" alt="" />
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2" style="width: 12px">
                                </td>
                                <td style="width: 43px">
                                    <img src="images/spacer.gif" width="1" height="97" alt="" />
                                </td>
                            </tr>
                            <tr>
                                <td style="background-image: url('');" class="style1">
                                    <table cellspacing="0" style="font-size: 12px">
                                        <tr>
                                            <td style="width: 400px">
                                                &nbsp;
                                            </td>
                                            <td style="width: 30px">
                                                &nbsp;
                                            </td>
                                            <td style="width: 30px">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 61px; height: 43px;">
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/login_9.gif" OnClick="ImageButton1_Click"
                                        Style="margin-left: 3px" />
                                </td>
                                <td style="width: 335px; height: 43px;">
                                    <img src="images/login_10.gif" width="64" height="26" alt="" onclick="empty()" style="cursor: hand" />
                                </td>
                                <td style="height: 43px; width: 43px;">
                                    <img src="images/spacer.gif" width="1" height="26" alt="" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" rowspan="2">
                                    &nbsp;
                                </td>
                                <td style="width: 43px">
                                    <img src="images/spacer.gif" width="1" height="9" alt="" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width: 66px">
                                    &nbsp;&nbsp;
                                </td>
                                <td style="width: 43px">
                                    <img src="images/spacer.gif" width="1" height="48" alt="" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </body>
        </html>
    </div>
    </form>
</body>
</html>
