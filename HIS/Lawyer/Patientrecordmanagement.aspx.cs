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
            string sqlallMember = "select * from Record_Information join Member_Information on Record_Information.PatientID=Member_Information.MemberID where Member_Information.MemberDepartment='Patient'";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Record_Information");
            if (ds.Tables["Record_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Record_Information"].DefaultView[0];
                this.Label11.Text = "All";
                this.Label10.Visible = true;
                this.Label11.Visible = true;
                ds.Clear();
            }

            this.GridView1.Visible = true;
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Record_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
            Session["Department"] = "";
            Session["ID"] = "";

            string sql3 = " select distinct(PatientID) from Record_Information join Member_Information on Record_Information.PatientID=Member_Information.MemberID where  Member_Information.MemberDepartment='Patient'";
            DataSet ds3 = new DataSet();
            ds3 = dataOperate.getDataset(sql3, "Record_Information");
            DataView rowview3 = ds3.Tables["Record_Information"].DefaultView;
            DropDownList1.DataSource = rowview3;
            DropDownList1.DataValueField = "PatientID";
            DropDownList1.DataBind();

            string sql2 = " select MemberID from Member_Information where  MemberDepartment='Patient'";
            DataSet ds2 = new DataSet();
            ds2 = dataOperate.getDataset(sql2, "Record_Information");
            DataView rowview2 = ds2.Tables["Record_Information"].DefaultView;
            //DropDownList2.DataSource = rowview2;
            //DropDownList2.DataValueField = "MemberID";
            //DropDownList2.DataBind();

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlallMember = "select * from Record_Information join Member_Information on Record_Information.PatientID=Member_Information.MemberID where Member_Information.MemberDepartment='Patient'";
        this.GridView1.Visible = true;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.Label11.Text = "All";
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Record_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string sqlallMember;
        this.Label10.Visible = false;
        this.Label11.Visible = false;
        string drbj = DropDownList1.SelectedValue.ToString();
        DataSet ds = new DataSet();
        sqlallMember = "select * from Record_Information join Member_Information on Record_Information.PatientID=Member_Information.MemberID and Member_Information.MemberID='" + drbj + "' where Member_Information.MemberDepartment='Patient'";
        ds = dataOperate.getDataset(sqlallMember, "Record_Information");
        if (ds.Tables["Record_Information"].Rows.Count > 0)
        {
            DataRowView rowview = ds.Tables["Record_Information"].DefaultView[0];
            this.Label11.Text = rowview["PatientID"].ToString();
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
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Record_Information");
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
        this.GridView1.DataSource = dataOperate.getDataset(Convert.ToString(Session["search"]), "Member_Information");
        this.GridView1.DataBind();
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        string sqlallMember;
        this.Label10.Visible = false;
        this.Label11.Visible = false;
        string drbj = sid.Text;
        DataSet ds = new DataSet();
        sqlallMember = "select * from Record_Information join Member_Information on Record_Information.PatientID=Member_Information.MemberID and Record_Information.RecordID='" + drbj + "' where Member_Information.MemberDepartment='Patient'";
        ds = dataOperate.getDataset(sqlallMember, "Record_Information");
        if (ds.Tables["Record_Information"].Rows.Count > 0)
        {
            DataRowView rowview = ds.Tables["Record_Information"].DefaultView[0];
            this.Label11.Text = "ID: " + drbj + "";
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
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Record_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;
    }
}