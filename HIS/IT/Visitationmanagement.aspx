<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Visitationmanagement.aspx.cs" Inherits="Management" %>

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
    <title>HIS---IT</title>
    <link href="../table.css" rel="stylesheet" type="text/css" />
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
                        <td class="style1" align="center">
                            <asp:Label ID="Label1" runat="server" Text="Searching by:" Font-Names="Miriam" 
                                ForeColor="White"></asp:Label>
                            <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
<%--                                <asp:ListItem Selected="True">Selected</asp:ListItem>--%>
                                <asp:ListItem>Bill</asp:ListItem>
                                <asp:ListItem>Record</asp:ListItem>
                                <asp:ListItem>Patient</asp:ListItem>
                                <asp:ListItem>AllMember</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style1" align="center">
                            <asp:DropDownList ID="DropDownList8" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="DropDownList8_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownList1" runat="server" Style="margin-bottom: 0px" Width="86px" Visible="False">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="Button3" runat="server" Text="Search" OnClick="Button3_Click" Height="21px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" align="justify">
                            <asp:Label ID="Label13" runat="server" Text="Searching by：" 
                                Font-Names="Miriam" ForeColor="White"></asp:Label>
                            <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True">
<%--                                <asp:ListItem Selected="True">Selected</asp:ListItem>--%>
                                <asp:ListItem>Bill</asp:ListItem>
                                <asp:ListItem>Patient</asp:ListItem>
                                <asp:ListItem>Record</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="*" ControlToValidate="sid" ValidationGroup="3"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style2" align="center">
                            <asp:TextBox ID="sid" runat="server" Width="85px"></asp:TextBox>
                                            </td>
                        <td align="center">
                            <asp:Button ID="Button8" runat="server" Text="Search" OnClick="Button8_Click" ValidationGroup="3" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="style3" align="center">
                            <asp:Button ID="Button1" runat="server" Text="Search All Visitation Information" OnClick="Button1_Click" />
                        </td>
                    </tr>

                   
                   <tr>

                        <td class="style4" colspan="3">
                        </td>
                    </tr>
                       <tr>
                        <td class="style4" align="center" style="font-family: Miriam; color: #FFFFFF">
                            Delete Selected Data</td>
                        <td class="style4" colspan="2">
                            <center><asp:Button ID="DSD" runat="server" Text="Delete" Width="60px" OnClick="DSD_Click" /></center>
                        </td>
                    </tr>   <tr>

                        <td class="style4" colspan="3">
                        </td>
                    </tr>
                    
                   
                    <tr>
                        <td class="style1" align="center">
                            <%--<asp:Button ID="Button6" runat="server" Text="Insert Member Information" 
                                onclick="Button6_Click" />--%>
                        </td>
                        <td class="style2" colspan=2>
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
            <div style="width: 70%; float: right;">
                <br />
                <asp:Label ID="Label10" runat="server" Text="Visitation Information：" 
                    Font-Size="X-Large" Visible="False" Font-Names="Miriam" ForeColor="White"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label11" runat="server" Font-Size="X-Large" Visible="False" 
                    Font-Names="Miriam" ForeColor="White"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:db_hospitalConnectionString %>" 
                    SelectCommand="SELECT [DepartmentName] FROM [Department_Information]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="5" CellSpacing="3"
                    EnableModelValidation="True" Visible="False" DataKeyNames="MemberID" OnPageIndexChanging="GridView1_PageIndexChanging"
                    AllowPaging="True" PageSize="15"   >
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Label12" runat="server" Text="All"></asp:Label> 
                                <asp:CheckBox ID="CheckAll" runat="server" onclick= "SelectAllCheckboxes(this);"   />   
                            </HeaderTemplate>
                        
                        <ItemTemplate>
                             <center><asp:CheckBox ID="CB" runat="server" /> </center>
                         </ItemTemplate>
                             </asp:TemplateField>
                        <asp:BoundField HeaderText="ID" DataField="MemberID"/>
                        <asp:BoundField HeaderText="Name" DataField="MemberName"/>
                        <asp:BoundField HeaderText="Member Type" DataField="MemberDepartment"/>
                        <asp:BoundField HeaderText="RecordID" DataField="RecordID"/>
                        <asp:BoundField HeaderText="BillID" DataField="BillID"/>
                        <asp:BoundField HeaderText="Operation" DataField="Working"/>
                        <asp:BoundField HeaderText="Location" DataField="Location" />
                        <asp:BoundField HeaderText="Time" DataField="Visitation" />
                        <%--<asp:HyperLinkField HeaderText="More" Text="Select" DataNavigateUrlFields="Visitation"
                            Target="main" DataNavigateUrlFormatString="~/IT/Memberinfo.aspx?Visitation={0}" />--%>

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
