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
            string sqlallMember = "select * from Authorization_Information";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Authorization_Information");
            if (ds.Tables["Authorization_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Authorization_Information"].DefaultView[0];
                this.Label11.Text = "All";
                this.Label10.Visible = true;
                this.Label11.Visible = true;
                ds.Clear();
            }

            this.GridView1.Visible = true;
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Authorization_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
            Session["ID"] = "";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlallMember = "select * from Authorization_Information";
        this.GridView1.Visible = true;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.Label11.Text = "All";
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Authorization_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string sqlallMember;
        this.Label10.Visible = false;
        this.Label11.Visible = false;
        string drbj = DropDownList1.SelectedValue.ToString();

        sqlallMember = "select * from Authorization_Information where AuthorizationID='" + drbj + "'";
        DataSet ds = new DataSet();
        ds = dataOperate.getDataset(sqlallMember, "Authorization_Information");
        if (ds.Tables["Authorization_Information"].Rows.Count > 0)
        {
            DataRowView rowview = ds.Tables["Authorization_Information"].DefaultView[0];
            this.Label11.Text = rowview["AuthorizationID"].ToString();
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
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Authorization_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;


    }
    
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.GridView1.DataSource = dataOperate.getDataset(Convert.ToString(Session["search"]), "Authorization_Information");
        this.GridView1.DataBind();
    }


    protected void Button7_Click(object sender, EventArgs e)
    {
        int cont = this.GridView1.Rows.Count;

        for (int i = 0; i < cont; i++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CB");
            if (cb.Checked == true)
            {
                string rid = GridView1.Rows[i].Cells[3].Text;
                string pid = GridView1.Rows[i].Cells[2].Text;
                string did = GridView1.Rows[i].Cells[1].Text;
                string aid = GridView1.Rows[i].Cells[4].Text;

                string sqlr = "update Authorization_Information set AuthorizationID='" + DropDownList5.Text + "' where RecordID='"+rid+"' and PatientID='"+pid+"' and DoctorID='"+did+"' and AuthorizationID='"+aid+"'";
                if (dataOperate.execSQL(sqlr))
                {
                    RegisterStartupScript("", "<script>alert('Modify Successful！')</script>");
                }
                else
                {
                    RegisterStartupScript("", "<script>alert('Modify failed！')</script>");

                }
                string sqlallMember = "select * from Authorization_Information";
                this.GridView1.Visible = true;
                this.Label10.Visible = true;
                this.Label11.Visible = true;
                this.Label11.Text = "All";
                this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Authorization_Information");
                this.GridView1.DataBind();
                Session["search"] = sqlallMember;
            }

        }
        



    }



    protected void DSD_Click(object sender, EventArgs e)
    {
        int cont = this.GridView1.Rows.Count;

        for (int i = 0; i < cont; i++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CB");
            if (cb.Checked == true)
            {
                string rid = GridView1.Rows[i].Cells[3].Text;
                string pid = GridView1.Rows[i].Cells[2].Text;
                string did = GridView1.Rows[i].Cells[1].Text;
                string aid = GridView1.Rows[i].Cells[4].Text;

                string sqlr = "Delete Authorization_Information  where RecordID='" + rid + "' and PatientID='" + pid + "' and DoctorID='" + did + "' and AuthorizationID='" + aid + "'";
                int a = 0;
                a = dataOperate.SqlENQ(sqlr);
                if (a > 0 && dataOperate.execSQL(sqlr))
                {
                    RegisterStartupScript("", "<script>alert('Delete Successful！')</script>");
                }
                else
                {
                    RegisterStartupScript("", "<script>alert('Delete failed！')</script>");

                }

            }
        }
        string sqlallMember = "select * from Authorization_Information";
        this.GridView1.Visible = true;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.Label11.Text = "All";
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Authorization_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        string sqlallMember;
        this.Label10.Visible = false;
        this.Label11.Visible = false;
        string drbj = sid.Text;

        sqlallMember = "select * from Authorization_Information where AuthorizationID='" + drbj + "'";
        DataSet ds = new DataSet();
        ds = dataOperate.getDataset(sqlallMember, "Authorization_Information");
        if (ds.Tables["Authorization_Information"].Rows.Count > 0)
        {
            DataRowView rowview = ds.Tables["Authorization_Information"].DefaultView[0];
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
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Authorization_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;
        sid.Text = "";
    }



}