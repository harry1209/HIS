<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Billmanagement.aspx.cs" Inherits="Management" %>

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
            width: 250px;
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
        .auto-style1 {
            width: 109px;
            height: 23px;
        }
        .auto-style2 {
            height: 20px;
            width: 250px;
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
                            <asp:Label ID="Label13" runat="server" Text="Searching by:" Font-Names="Miriam" 
                                ForeColor="White"></asp:Label>
                            <asp:DropDownList ID="DropDownList6" runat="server" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" AutoPostBack="True">
<%--                                <asp:ListItem Selected="True">Selected</asp:ListItem>--%>
                                <asp:ListItem>Bill</asp:ListItem>
                                <asp:ListItem>Patient</asp:ListItem>
                                <asp:ListItem>Record</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style1" align="center">
                            <asp:DropDownList ID="DropDownList1" runat="server" Style="margin-bottom: 0px" Width="86px" Visible="False">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="Button3" runat="server" Text="Search" OnClick="Button3_Click" style="height: 21px" />
                        </td>
                    </tr>

                    <tr>
                        <td colspan="3" class="style3" align="center">
                            <asp:Button ID="Button1" runat="server" Text="Search All Bill Information" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div style="width: 70%; float: right;">
                <br />
                <asp:Label ID="Label10" runat="server" Text="All Bill Information：" 
                    Font-Size="X-Large" Visible="False" Font-Names="Miriam" ForeColor="White"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label11" runat="server" Font-Size="X-Large" Visible="False" 
                    Font-Names="Miriam" ForeColor="White"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:db_HospitalConnectionString %>" 
                    SelectCommand="SELECT * FROM [Record_Information]"></asp:SqlDataSource>
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
                        
                        <asp:BoundField HeaderText="Patient ID" DataField="MemberID"/>
                        <asp:BoundField HeaderText="Record ID" DataField="RecordID"/>
                        <asp:BoundField HeaderText="Bill ID" DataField="BillID"/>
                        <asp:BoundField HeaderText="Name" DataField="MemberName"/>

                        <asp:HyperLinkField HeaderText="More" Text="Select" DataNavigateUrlFields="PatientID,DoctorID,RecordID,BillID" DataNavigateUrlFormatString="~/Patient/Billview.aspx?PatientID={0}&DoctorID={1}&RecordID={2}&BillID={3}"
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
