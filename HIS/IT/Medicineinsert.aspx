<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Medicineinsert.aspx.cs" Inherits="Insert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>HIS---IT</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="float: left; font-family: Miriam; color: #FFFFFF;">
            <asp:Label ID="lbmsg" runat="server" ForeColor="Red"></asp:Label><br />
            <asp:FileUpload ID="fuload" runat="server" Font-Names="Miriam" 
                ForeColor="White" />
            <asp:Button ID="btnOk" runat="server" Text="Import SQL Serve Database" 
                OnClick="btnOk_Click" Font-Underline="False" ForeColor="Black" />
            <br />
            Data in Excel       <asp:GridView ID="GridView1" runat="server">

            </asp:GridView>
        </div>
        <br />
        <br />
        <div style="float: right; font-family: Miriam; color: #FFFFFF;">
            After import successful，All Data:<br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
                OnPageIndexChanging="GridView2_PageIndexChanging" AllowPaging="true" 
                PageSize="15">
                <Columns>
                    <asp:BoundField DataField="MedicineID" HeaderText="MedicineID" />
                    <asp:BoundField DataField="MedicineName" HeaderText="MedicineName" />
                    <asp:BoundField DataField="MedicineType" HeaderText="MedicineType" />
                    <asp:BoundField DataField="MedicinePrice" HeaderText="MedicinePrice" />
                    <asp:BoundField DataField="MedicineInfo" HeaderText="MedicineInfo" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
