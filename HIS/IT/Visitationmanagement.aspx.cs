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


public partial class Management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            this.Label10.Visible = false;
            this.Label11.Visible = false;
            string drbj = DropDownList1.SelectedValue.ToString();
            string sqlallMember = "select * from Visitation_Information join Member_Information on Visitation_Information.MemberID=Member_Information.MemberID";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Visitation_Information");
            if (ds.Tables["Visitation_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Visitation_Information"].DefaultView[0];
                this.Label11.Text = "all";
                this.Label10.Visible = true;
                this.Label11.Visible = true;
                ds.Clear();
            }
            this.GridView1.Visible = true;
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Visitation_Information");
            this.GridView1.DataBind();


            DropDownList1.Visible = true;
            string a1 = DropDownList6.SelectedValue;
            if (a1 == "Patient")
                a1 = "Member";

            string sql3 = "select distinct(" + a1 + "ID) from Bill_Information";
            DataSet ds3 = new DataSet();
            ds3 = dataOperate.getDataset(sql3, "Bill_Information");
            DataView rowview3 = ds3.Tables["Bill_Information"].DefaultView;
            DropDownList1.DataSource = rowview3;
            DropDownList1.DataValueField = "" + a1 + "ID";
            DropDownList1.DataBind();
            Session["search"] = sqlallMember;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlallMember = "select * from Visitation_Information join Member_Information on Visitation_Information.MemberID=Member_Information.MemberID";
        this.GridView1.Visible = true;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.Label11.Text = "All";
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Visitation_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string sqlallMember;
        this.Label10.Visible = false;
        this.Label11.Visible = false;
        string drbj = DropDownList1.SelectedValue.ToString();
        string did = DropDownList6.SelectedValue.ToString();
        if (did == "Patient")
            did = "Member";


        sqlallMember = "select * from Visitation_Information join Member_Information on Visitation_Information.MemberID=Member_Information.MemberID where Visitation_Information."+did+"ID='" + drbj + "'";
        DataSet ds = new DataSet();
        ds = dataOperate.getDataset(sqlallMember, "Visitation_Information");
        if (ds.Tables["Visitation_Information"].Rows.Count > 0)
        {
            DataRowView rowview = ds.Tables["Visitation_Information"].DefaultView[0];
            this.Label11.Text = rowview[""+did+"ID"].ToString();
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            ds.Clear();
        }
        else
        {
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "None Data";
        }

        this.GridView1.Visible = true;
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Visitation_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;
        
    }
    

    

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/IT/Insert.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.GridView1.DataSource = dataOperate.getDataset(Convert.ToString(Session["search"]), "Visitation_Information");
        this.GridView1.DataBind();
    }



    protected void DSD_Click(object sender, EventArgs e)
    {
            int cont = this.GridView1.Rows.Count;

            for (int i = 0; i < cont; i++)
            {
                CheckBox cb =(CheckBox) GridView1.Rows[i].FindControl("CB");
                if (cb.Checked == true)
                {
                    string rid = GridView1.Rows[i].Cells[8].Text;
                    string sqlr = "Delete Visitation_Information where Visitation='"+rid+"'";
                    int a = 0;
                    a = dataOperate.SqlENQ(sqlr);
                    if (a>0 && dataOperate.execSQL(sqlr))
                    {
                        RegisterStartupScript("", "<script>alert('Delete Successful！')</script>");
                    }
                    else
                    {
                        RegisterStartupScript("", "<script>alert('Delete failed！')</script>");

                    }

                }
            }
            this.DropDownList1.DataBind();
            string sqlallMember = "select * from Visitation_Information join Member_Information on Visitation_Information.MemberID=Member_Information.MemberID";
            this.GridView1.Visible = true;
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "All";
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Visitation_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        string sqlallMember;
        this.Label10.Visible = false;
        this.Label11.Visible = false;
        string drbj = sid.Text;
        string did = DropDownList7.SelectedValue.ToString();
        if (did == "Patient")
            did = "Member";

        sqlallMember = "select * from Visitation_Information join Member_Information on Visitation_Information.MemberID=Member_Information.MemberID where Visitation_Information." + did + "ID='" + drbj + "'";
        DataSet ds = new DataSet();
        ds = dataOperate.getDataset(sqlallMember, "Visitation_Information");
        if (ds.Tables["Visitation_Information"].Rows.Count > 0)
        {
            DataRowView rowview = ds.Tables["Visitation_Information"].DefaultView[0];
            this.Label11.Text = rowview["" + did + "ID"].ToString();
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            ds.Clear();
        }
        else
        {
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "None Data";
        }
        this.GridView1.Visible = true;
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Visitation_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;
    }

    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList1.Visible = true;
        DropDownList8.Visible = false;
        string a = DropDownList6.SelectedValue;

        if (a == "Patient")
        {
            a = "Member";
            DropDownList8.Visible = true;
            string sql = "select * from Department_Information";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sql, "Department_Information");
            DataView rowview = ds.Tables["Department_Information"].DefaultView;
            DropDownList8.DataSource = rowview;
            DropDownList8.DataValueField = "DepartmentName";
            DropDownList8.DataBind();

            string sql1 = "select distinct Visitation_Information.MemberID from Visitation_Information join Member_Information on Visitation_Information.MemberID=Member_Information.MemberID where MemberDepartment='" + DropDownList8.SelectedValue + "'";
            DataSet ds1 = new DataSet();
            ds1 = dataOperate.getDataset(sql1, "Visitation_Information");
            DataView rowview1 = ds1.Tables["Visitation_Information"].DefaultView;
            DropDownList1.DataSource = rowview1;
            DropDownList1.DataValueField = "MemberID";
            DropDownList1.DataBind();

        }
        else
        {
            string sql = "select distinct(" + a + "ID) from Bill_Information";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sql, "Bill_Information");
            DataView rowview = ds.Tables["Bill_Information"].DefaultView;
            DropDownList1.DataSource = rowview;
            DropDownList1.DataValueField = "" + a + "ID";
            DropDownList1.DataBind();
        }
    }
    protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList1.Visible = true;
        string a = DropDownList6.SelectedValue;

        string sql1 = "select distinct Visitation_Information.MemberID from Visitation_Information join Member_Information on Visitation_Information.MemberID=Member_Information.MemberID where MemberDepartment='" + DropDownList8.SelectedValue + "'";
        DataSet ds1 = new DataSet();
        ds1 = dataOperate.getDataset(sql1, "Visitation_Information");
        DataView rowview1 = ds1.Tables["Visitation_Information"].DefaultView;
        DropDownList1.DataSource = rowview1;
        DropDownList1.DataValueField = "MemberID";
        DropDownList1.DataBind();
    }
}