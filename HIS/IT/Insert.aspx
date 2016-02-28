<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="Insert" %>

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
                    <asp:BoundField DataField="MemberID" HeaderText="ID" />
                    <asp:BoundField DataField="MemberName" HeaderText="Name" />
                    <asp:BoundField DataField="MemberGender" HeaderText="Gender" />
                    <asp:BoundField DataField="MemberAge" HeaderText="Age" />
                    <asp:BoundField DataField="MemberDepartment" HeaderText="Department" />
                    <asp:BoundField DataField="MemberEmail" HeaderText="Email" />
                    <asp:BoundField DataField="MemberTel" HeaderText="Tel" />
                    <asp:BoundField DataField="MemberAddress" HeaderText="Address" />
                    <asp:BoundField DataField="MemberComment" HeaderText="Comment" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
