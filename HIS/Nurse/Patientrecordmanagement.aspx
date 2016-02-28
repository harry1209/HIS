<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Patientrecordmanagement.aspx.cs" Inherits="Management" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript">
    function empty() {
        form1.xuehao.value = "";
        form1.xingming.value = "";
        form1.youxiang.value = "";

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
    <title>HIS---Nurse</title>
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
                            <asp:Label ID="Label1" runat="server" Text="Searching by Patient ID：" 
                                Font-Names="Miriam" ForeColor="White"></asp:Label>
                        </td>
                        <td class="style2" align="center">
                            <asp:DropDownList ID="DropDownList1" runat="server" Style="margin-bottom: 0px" Width="70px">
                                <asp:ListItem Selected="True">Seleted</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="center">
                            <asp:Button ID="Button3" runat="server" Text="Search" OnClick="Button3_Click" />
                        </td>
                    </tr>
                     <tr>
                        <td class="style1" align="justify">
                            <asp:Label ID="Label13" runat="server" Text="Searching by Record ID：" 
                                Font-Names="Miriam" ForeColor="White"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="*" ControlToValidate="sid" ValidationGroup="5"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style2" align="center">
                            <asp:TextBox ID="sid" runat="server" Width="85px"></asp:TextBox>
                                            </td>
                        <td align="center">
                            <asp:Button ID="Button8" runat="server" Text="Search"  ValidationGroup="5" OnClick="Button8_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="style3" align="center">
                            <asp:Button ID="Button1" runat="server" Text="Search All Patient Record Information" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div style="width: 70%; float: right;">
                <br />
                <asp:Label ID="Label10" runat="server" Text="Patient Record Information：" 
                    Font-Size="X-Large" Visible="False" Font-Names="Miriam" ForeColor="White"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label11" runat="server" Font-Size="X-Large" Visible="False" 
                    Font-Names="Miriam" ForeColor="White"></asp:Label>
                <br />
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
                        <asp:BoundField HeaderText="Doctor ID" DataField="DoctorID"/>
                        <asp:BoundField HeaderText="Patient ID" DataField="PatientID"/>
                        <asp:BoundField HeaderText="Record ID" DataField="RecordID"/>
                        <asp:BoundField HeaderText="Name" DataField="MemberName"/>
                        <asp:BoundField HeaderText="Gender" DataField="MemberGender"/>
                        <asp:BoundField HeaderText="Age" DataField="MemberAge"/>
                        <asp:HyperLinkField HeaderText="More" Text="Select" DataNavigateUrlFields="DoctorID,PatientID,RecordID" DataNavigateUrlFormatString="~/Nurse/Recordview.aspx?DoctorID={0}&PatientID={1}&RecordID={2}"
                            Target="main" />

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
