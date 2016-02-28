<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Medicinemanagement.aspx.cs" Inherits="Management" %>

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
                        <td class="style1" align="justify">
                            <asp:Label ID="Label1" runat="server" Text="Searching by Department：" 
                                Font-Names="Miriam" ForeColor="White"></asp:Label>
                        </td>
                        <td class="style2" align="center">
                            <asp:DropDownList ID="DropDownList1" runat="server" Style="margin-bottom: 0px" 
                                DataSourceID="SqlDataSource2" DataTextField="MedicinetypeName" 
                                DataValueField="MedicinetypeName" Width="70px">
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
                        <td class="style4">
                        </td>
                        <td class="style4" colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td class="style4" colspan="3" align="center" 
                            style="font-family: Miriam; color: #FFFFFF">
                            Add and Delete Medicine Type
                        </td>

                    </tr>
                    <tr>
                        <td class="style1" align="center">
                            <asp:Label ID="Label8" runat="server" Text="Medicine Type：" Font-Names="Miriam" 
                                ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="*" ControlToValidate="banhao" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:TextBox ID="banhao" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" align="center">
                            <asp:Button ID="Button4" runat="server" Text="Add" OnClick="Button4_Click" ValidationGroup="2"/>
                            &nbsp;<asp:Button ID="Button5" runat="server" Text="Delete" OnClick="Button5_Click" OnClientClick="{if(confirm('确定删除？')){return true;}return false;}" ValidationGroup="2"/>
                        </td>
                        <td class="style2" colspan=2 align="center">
                            <img alt="" height="26" onclick="empty2()" src="../images/cz.gif" style="cursor: hand"
                                width="64" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style4" align="center">
                   
                            <asp:DropDownList ID="DropDownList5" runat="server" 
                                DataSourceID="SqlDataSource2" DataTextField="MedicinetypeName" DataValueField="MedicinetypeName" >
                            </asp:DropDownList>
                        </td>
                        <td class="style4" colspan="2">
                            <center><asp:Button ID="Button7" runat="server" Text="Modify Type" Width="135px" OnClick="Button7_Click" /></center>
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
                    </tr>   
                    <tr>
                        <td class="style4">
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
                            <asp:Label ID="Label4" runat="server" Text="Item ID：" Font-Names="Miriam" 
                                ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="*" ControlToValidate="xuehao" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:TextBox ID="xuehao" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" align="center">
                            <asp:Label ID="Label2" runat="server" Text="Item Name：" Font-Names="Miriam" 
                                ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="*" ControlToValidate="xingming" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:TextBox ID="xingming" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                   
                    <tr>
                        <td class="style1" align="center">
                            <asp:Label ID="Label9" runat="server" Text="Item Type：" Font-Names="Miriam" 
                                ForeColor="White"></asp:Label>
                        </td>
                        <td class="style2" colspan="2" align="center">
                            <asp:DropDownList ID="DropDownList4" runat="server" 
                                DataSourceID="SqlDataSource2" DataTextField="MedicinetypeName" DataValueField="MedicinetypeName">
                            </asp:DropDownList>
                        </td>
                    </tr>
                                        <tr>
                        <td class="style1" align="center">
                            <asp:Label ID="Label3" runat="server" Text="Item Price(CAD)：" Font-Names="Miriam" 
                                ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ErrorMessage="*" ControlToValidate="TextBox1" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style2" colspan="2">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
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
                    <tr>
                        <td class="style1" align="center">
                            <asp:Button ID="Button6" runat="server" Text="Insert Medicine Information" 
                                onclick="Button6_Click" />
                        </td>
                        <td class="style2" colspan=2>
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
            <div style="width: 70%; float: right;">
                <br />
                <asp:Label ID="Label10" runat="server" Text="Medicine Information：" 
                    Font-Size="X-Large" Visible="False" Font-Names="Miriam" ForeColor="White"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label11" runat="server" Font-Size="X-Large" Visible="False" 
                    Font-Names="Miriam" ForeColor="White"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:db_hospitalConnectionString %>" 
                    SelectCommand="SELECT [MedicinetypeName] FROM [Medicinetype_Information]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="5" CellSpacing="3"
                    EnableModelValidation="True" Visible="False" DataKeyNames="MedicineID" OnPageIndexChanging="GridView1_PageIndexChanging"
                    AllowPaging="True" PageSize="15"   >
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Label12" runat="server" Text="All"></asp:Label> 
                               <asp:CheckBox ID="CheckAll" runat="server" onclick= "SelectAllCheckboxes(this);"   />    
                            </HeaderTemplate>
                        
                        <ItemTemplate>
                             <center><asp:CheckBox ID="CB" runat="server" /> </center></center>
                         </ItemTemplate>
                             </asp:TemplateField>
                        <asp:BoundField HeaderText="Item ID" DataField="MedicineID"/>
                        <asp:BoundField HeaderText="Item Name" DataField="MedicineName"/>
                        <asp:BoundField HeaderText="Item Type" DataField="MedicineType"/>
                        <asp:BoundField HeaderText="Item Price" DataField="MedicinePrice"/>
                        <asp:HyperLinkField HeaderText="More" Text="Select" DataNavigateUrlFields="MedicineID,MedicineName"
                            Target="main" DataNavigateUrlFormatString="~/IT/Medicineview.aspx?MedicineID={0}&MedicineName={1}" />

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
