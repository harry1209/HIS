<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Authorizationmanagement.aspx.cs" Inherits="Management" %>

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
                        <td class="style1" align="justify">
                            <asp:Label ID="Label1" runat="server" Text="Searching by DoctorID：" 
                                Font-Names="Miriam" ForeColor="White"></asp:Label>
                        </td>
                        <td class="style2" align="center">
                            <asp:DropDownList ID="DropDownList1" runat="server" Style="margin-bottom: 0px" 
                                DataSourceID="SqlDataSource2" DataTextField="AuthorizationID" 
                                DataValueField="AuthorizationID" Width="70px">
                                <asp:ListItem Selected="True">请选择</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="center">
                            <asp:Button ID="Button3" runat="server" Text="Search" OnClick="Button3_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" align="justify">
                            <asp:Label ID="Label13" runat="server" Text="Searching by Member ID：" 
                                Font-Names="Miriam" ForeColor="White"></asp:Label>
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
                            <asp:Button ID="Button1" runat="server" Text="Search All Member Information" OnClick="Button1_Click" />
                        </td>
                    </tr>
                    
                    <tr>

                        <td class="style2" colspan="3" align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style4" align="center">
                   
                            <asp:DropDownList ID="DropDownList5" runat="server" 
                                DataSourceID="SqlDataSource3" DataTextField="MemberID" DataValueField="MemberID" >
                            </asp:DropDownList>
                        </td>
                        <td class="style4" colspan="2">
                            <center><asp:Button ID="Button7" runat="server" Text="Modify Department" Width="135px" OnClick="Button7_Click" style="height: 32px" /></center>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                        </td>
                        <td class="style4" colspan="2">
                        </td>
                    </tr>
                       <tr>
                        <td class="style4" align="center" style="font-family: Miriam; color: #FFFFFF">
                            Delete Selected Data</td>
                        <td class="style4" colspan="2">
                            <center><asp:Button ID="DSD" runat="server" Text="Delete" Width="60px" OnClick="DSD_Click" /></center>
                        </td>
                    </tr>   <tr>
                        <td class="style4">
                        </td>
                        <td class="style4" colspan="2">
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:db_HospitalConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [AuthorizationID] FROM [Authorization_Information]"></asp:SqlDataSource>
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
                        <asp:BoundField HeaderText="PatientID" DataField="PatientID"/>
                        <asp:BoundField HeaderText="RecordID" DataField="RecordID"/>
                        <asp:BoundField HeaderText="Authorization ID" DataField="AuthorizationID"/>



                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db_HospitalConnectionString %>" SelectCommand="SELECT [MemberID] FROM [Member_Information] WHERE ([MemberDepartment] = @MemberDepartment)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Doctor" Name="MemberDepartment" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </center>
    </form>
</body>
</html>
