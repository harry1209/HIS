﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Appointmentmanagement.aspx.cs" Inherits="Management" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript">
    function empty() {
        form1.xuehao.value = "";
        form1.xingming.value = "";
        form1.youxiang.value = "";
        form1.dizhi.value = "";
        form1.lianxifangshi.value = "";
    }
    function empty2() {
        form1.banhao.value = "";
    }

    function SelectAllCheckboxes(spanChk) {
        elm = document.forms[0];

        for (i = 0; i < elm.length; i++) {
            if (elm[i].type == "checkbox" && elm[i].id != spanChk.id) {
                if (elm.elements[i].checked != spanChk.checked)
                    elm.elements[i].click();
            }
        }
    }
</script>
<head runat="server">
    <title>HIS---Patient</title>
    <link href="../table.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 300px;
            height: 23px;
        }
        .style2
        {
            width: 100px;
            height: 23px;
        }
        .style3
        {
            width: 300px;
            height: 20px;
        }
        .style4
        {
            height: 20px;
        }
    </style>
</head>
<body>
<br />
<br />
<br />
    <form id="form1" runat="server">
    <center>
        <div>
            <div style="width: 30%; float: left;">
                <table>
                   

                       <tr>
                        <td class="style4" align="center" style="font-family: Miriam; color: #FFFFFF">
                            Delete Selected Data</td>
                        <td class="style4" colspan="2">
                            <center><asp:Button ID="DSD" runat="server" Text="Delete" Width="60px" OnClick="DSD_Click" /></center>
                        </td>
                    </tr>   <tr>
                        <td class="style4">
                            <asp:Button ID="Button" runat="server" Text="Show all" OnClick="Button1_Click" />
                        </td>
                        <td class="style4" colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center" style="font-family: Miriam; color: #FFFFFF">
                            Add Member Information：
                        </td>
                    </tr>
                   
                   
                    <tr>
                        <td class="style1" align="center">
                            <asp:Label ID="Label3" runat="server" Text="Doctor ID：" Font-Names="Miriam" 
                                ForeColor="White"></asp:Label>
                        </td>
                        <td class="style2" colspan="2" align="center">
                            <asp:DropDownList ID="DropDownList3" runat="server" >

                            </asp:DropDownList>
                        </td>
                    </tr>


                    <tr>
                        <td class="style1" colspan="3" align="center">
                            <asp:Label ID="Label7" runat="server" Text="Content：" Font-Names="Miriam" 
                                ForeColor="White"></asp:Label>
                        </td>
                    </tr>
                    
                     <tr>
                        <td class="style4" colspan="3">
                            <asp:TextBox ID="md" runat="server" Height="200px" TextMode="MultiLine" Width="581px" Wrap="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" align="center">
                            <asp:Button ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" 
                                ValidationGroup="1" />
                        </td>
                        <td class="style2" colspan=2 align="center">
                            <img alt="" height="26" onclick="empty()" src="../images/cz.gif" style="cursor: hand"
                                width="64" />
                        </td>
                    </tr>

                </table>
            </div>
            <div style="width: 70%; float: right;">
                <br />
                <asp:Label ID="Label10" runat="server" Text="Member Information：" 
                    Font-Size="X-Large" Visible="False" Font-Names="Miriam" ForeColor="White"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label11" runat="server" Font-Size="X-Large" Visible="False" 
                    Font-Names="Miriam" ForeColor="White"></asp:Label>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="5" CellSpacing="3"
                    EnableModelValidation="True" Visible="False" DataKeyNames="DoctorID" OnPageIndexChanging="GridView1_PageIndexChanging"
                    AllowPaging="True" PageSize="15"   >
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Label12" runat="server" Text="All"></asp:Label> 
                                <asp:CheckBox ID="CheckAll" runat="server" onclick= "SelectAllCheckboxes(this);"   />    

                            </HeaderTemplate>
                        
                        <ItemTemplate>
                             <center>
                                <center> <asp:CheckBox ID="CB" runat="server" /> </center>
                         </ItemTemplate>
                             </asp:TemplateField>
                        <asp:BoundField HeaderText="Doctor ID" DataField="DoctorID"/>
                        <asp:BoundField HeaderText="Submit Time" DataField="SubmitTime"/>
                        <asp:HyperLinkField HeaderText="Status" Text="Not Reply" />
                        <asp:HyperLinkField HeaderText="More" Text="Select" DataNavigateUrlFields="DoctorID"
                            Target="main" DataNavigateUrlFormatString="~/IT/Memberinfo.aspx?MemberID={0}" />

                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
            <br />
        </div>
    </center>
    </form>
</body>
</html>
