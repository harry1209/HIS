using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["no"] = "";
            Session["name"] = "";
            txtUsername.Text = "";
            txtUserpwd.Text = "";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        if (Page.IsValid == true)
        {
            string userid = txtUsername.Text;
            string userpwd = txtUserpwd.Text;
            //string rb = rb1.SelectedValue.ToString();
            string sqllogin = "select * from Login_Information where MemberID='" + userid + "' and MemberPassword='" + userpwd + "'";
            int a = 0;
            if (dataOperate.seleSQL(sqllogin) > 0)
            {
                SqlDataReader reader = dataOperate.getRow(sqllogin);
                reader.Read();
                Session["IDLogin"] = reader["MemberID"].ToString();
                Session["IdentityInfo"] = reader["IdentityInfo"].ToString();
                string sqlmemberinfo = "select * from Member_Information where MemberID='" + userid + "'";
                dataOperate.seleSQL(sqlmemberinfo);
                SqlDataReader reader1 = dataOperate.getRow(sqlmemberinfo);
                reader1.Read();
                Session["NameLogin"] = reader1["MemberName"].ToString();
                Session["Password"] = reader["MemberPassword"].ToString();
                Session["DepartmentLogin"] = reader1["MemberDepartment"].ToString();
                if (Convert.ToString(Session["IdentityInfo"])=="Doctor")
                    Response.Redirect("Doctor/Doctormain.aspx");
                else if (Convert.ToString(Session["IdentityInfo"]) == "Nurse")
                    Response.Redirect("Nurse/Nursemain.aspx");
                else if (Convert.ToString(Session["IdentityInfo"]) == "Patient")
                    Response.Redirect("Patient/Patientmain.aspx");
                else if (Convert.ToString(Session["IdentityInfo"]) == "Lawyer")
                    Response.Redirect("Lawyer/Lawyermain.aspx");
                else if (Convert.ToString(Session["IdentityInfo"]) == "Financial")
                    Response.Redirect("Financialcenter/Financialcentermain.aspx");
                else if (Convert.ToString(Session["IdentityInfo"]) == "IT")
                    Response.Redirect("IT/ITmain.aspx");

            }
            if (dataOperate.seleSQL(sqllogin) == 0)
            {
                RegisterStartupScript("", "<script>alert('对不起，您输入的账号密码错误，请重新输入！')</script>");
            }
        }
    }
}