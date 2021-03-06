﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Billview.aspx.cs" Inherits="Billview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript">
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
    <title>HIS---Financialcenter</title>
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
        .auto-style1 {
            width: 200px;
            height: 24px;
        }
        .auto-style2 {
            width: 100px;
            height: 24px;
        }
    </style>
    <link href="../table.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <br />
    <br />
    <br />
    <form id="form2" runat="server">
        <center>
            <div>
                <div style="width: 30%; float: left;">
                    <table>
                        <tr>
                            <td colspan="2" align="center" style="font-family: Miriam; color: #FFFFFF">Edit Bill Information：
                            </td>
                        </tr>
                        <tr>
                            <td class="style1" align="center" style="font-family: Miriam; color: #FFFFFF">
                                <asp:Label ID="Label4" runat="server" Text="Patient ID："></asp:Label>
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="pid" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                                                <tr>
                            <td class="style1" align="center" style="font-family: Miriam; color: #FFFFFF">
                                <asp:Label ID="Label10" runat="server" Text="Doctor ID："></asp:Label>
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="did" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td class="style1" align="center" style="font-family: Miriam; color: #FFFFFF">
                                <asp:Label ID="Label1" runat="server" Text="Record ID："></asp:Label>
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="rid" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1" align="center" style="font-family: Miriam; color: #FFFFFF">
                                <asp:Label ID="Label8" runat="server" Text="Bill ID："></asp:Label>
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="bid" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1" align="center" style="font-family: Miriam; color: #FFFFFF">
                                <asp:Label ID="Label2" runat="server" Text="Patient Name："></asp:Label>
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="xingming" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>

                            <td class="style2" colspan="2"></td>
                        </tr>
                        <tr>
                        <td class="style4" align="center">
                   
                                <asp:TextBox ID="mquan" runat="server"></asp:TextBox>
                        </td>
                        <td class="style4" colspan="2">
                            <center><asp:Button ID="Button7" runat="server" Text="Modify Quantity" Width="135px" OnClick="Button7_Click" /></center>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4" align="center" style="font-family: Miriam; color: #FFFFFF">
                            Delete Selected Data</td>
                        <td class="style4" colspan="2">
                            <center><asp:Button ID="DSD" runat="server" Text="Delete" Width="60px" OnClick="DSD_Click" /></center>
                        </td>
                    </tr>   
                    </table>
                </div>
                <div style="width: 70%; float: right;">
                    <br />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Label ID="Label18" runat="server" Text="Bill Detail Information："
                        Font-Size="X-Large" Visible="False" Font-Names="Miriam" ForeColor="White"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:db_HospitalConnectionString %>"
                        SelectCommand="SELECT * FROM [Medicinetype_Information]"></asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="5" CellSpacing="3"
                        EnableModelValidation="True" Visible="False" DataKeyNames="BillItemID" AllowPaging="True" PageSize="15" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="Label12" runat="server" Text="All"></asp:Label>
                                    <asp:CheckBox ID="CheckAll" runat="server" onclick= "SelectAllCheckboxes(this);"   />  
                                </HeaderTemplate>

                                <ItemTemplate>
                                    <center>
                                        <asp:CheckBox ID="CB" runat="server" />
                                    </center>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" InsertVisible="False">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# this.GridView1.PageIndex * this.GridView1.PageSize + this.GridView1.Rows.Count + 1%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Item ID" DataField="BillItemID" />
                            <asp:BoundField HeaderText="Item Name" DataField="BillItemName" />
                            <asp:BoundField HeaderText="Item Type" DataField="BillItemType" />
                            <asp:BoundField HeaderText="Price" DataField="BillItemPrice" />
                            <asp:BoundField HeaderText="Quantity" DataField="BillItemQuantity" />


                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:Button ID="Button8" runat="server" onclick="Button8_Click" Text="Billprice" />
                    <asp:Label ID="Label19" runat="server" Text="$" Visible="False"></asp:Label>
                </div>
                <br />
            </div>
        </center>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
