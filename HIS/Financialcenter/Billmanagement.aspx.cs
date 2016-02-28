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
            string sqlallMember = "select * from Bill_Information join Member_Information on Bill_Information.PatientID=Member_Information.MemberID";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Bill_Information");
            if (ds.Tables["Bill_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Bill_Information"].DefaultView[0];
                this.Label11.Text = "all";
                this.Label10.Visible = true;
                this.Label11.Visible = true;
                ds.Clear();
            }

            DropDownList1.Visible = true;
            string a1 = DropDownList6.SelectedValue;


            string sql3 = "select distinct(" + a1 + "ID) from Bill_Information";
            DataSet ds3 = new DataSet();
            ds3 = dataOperate.getDataset(sql3, "Bill_Information");
            DataView rowview3 = ds3.Tables["Bill_Information"].DefaultView;
            DropDownList1.DataSource = rowview3;
            DropDownList1.DataValueField = "" + a1 + "ID";
            DropDownList1.DataBind();


            string sql = "select distinct(PatientID) from Record_Information";
            DataSet ds1 = new DataSet();
            ds1 = dataOperate.getDataset(sql, "Record_Information");
            DataView rowview1 = ds1.Tables["Record_Information"].DefaultView;
//           DropDownList8.DataSource = rowview1;
//            DropDownList8.DataValueField = "PatientID";
//            DropDownList8.DataBind();

//           DropDownList9.Visible = true;
//            string a = DropDownList8.SelectedValue;

//            string sql2 = "select RecordID from Record_Information where PatientID='" + a + "'";
//            DataSet ds2 = new DataSet();
//            ds2 = dataOperate.getDataset(sql2, "Record_Information");
//            DataView rowview2 = ds2.Tables["Record_Information"].DefaultView;
//            DropDownList9.DataSource = rowview2;
//            DropDownList9.DataValueField = "RecordID";
//             DropDownList9.DataBind();

            this.GridView1.Visible = true;
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Bill_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
            Session["Department"] = "";
            Session["ID"] = "";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlallMember = "select * from Bill_Information join Member_Information on Bill_Information.PatientID=Member_Information.MemberID";
        this.GridView1.Visible = true;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.Label11.Text = "All";
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Bill_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string sqlallMember;
        this.Label10.Visible = false;
        this.Label11.Visible = false;
        string type = DropDownList6.SelectedValue.ToString();
        string num = DropDownList1.SelectedValue.ToString();
        if (type!="Selected")
        {
            if (type == "Patient")
                type = "Member";
            sqlallMember = "select * from Bill_Information join Member_Information on Bill_Information.PatientID=Member_Information.MemberID and Bill_Information."+type+"ID='"+num+"'";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Member_Information");
            if (ds.Tables["Member_Information"].Rows.Count > 0)
            {
                if (type == "Member")
                    type = "Patient";
                DataRowView rowview = ds.Tables["Member_Information"].DefaultView[0];
                this.Label11.Text = ""+type+" ID";
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
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Member_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;

        }
        else
        {
            RegisterStartupScript("", "<script>alert('Please select type！')</script>");
            sqlallMember = "select * from Bill_Information join Member_Information on Bill_Information.PatientID=Member_Information.MemberID";
            this.GridView1.Visible = true;
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "All";
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Bill_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
        }
        
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


    protected void DSD_Click(object sender, EventArgs e)
    {
            int cont = this.GridView1.Rows.Count;

            for (int i = 0; i < cont; i++)
            {
                CheckBox cb =(CheckBox) GridView1.Rows[i].FindControl("CB");
                if (cb.Checked == true)
                {
                    string pid = GridView1.Rows[i].Cells[1].Text;
                    string did = GridView1.Rows[i].Cells[2].Text;
                    string rid = GridView1.Rows[i].Cells[3].Text;
                    string bid = GridView1.Rows[i].Cells[4].Text;
                    string sqlr = "Delete Bill_Information where PatientID='"+pid+"' and DoctorID='"+did+"' and RecordID='"+rid+"' and BillID='"+bid+"'";
                    int a = 0;
                    a = dataOperate.SqlENQ(sqlr);
                    if (a>0 && dataOperate.execSQL(sqlr))
                    {
                        RegisterStartupScript("", "<script>alert('Delete Successful！')</script>");
                        string time = DateTime.Now.ToString();
                        string sqlvisitation = "insert into Visitation_Information(RecordID,BillID,MemberID,Working,Location,Visitation) values('" + rid + "','" + rid + "','" + Convert.ToString(Session["IDLogin"]) + "','Deletion, successful','Bill','" + time + "')";
                        dataOperate.execSQL(sqlvisitation);
                    }
                    else
                    {
                        RegisterStartupScript("", "<script>alert('Delete failed！')</script>");
                        string time = DateTime.Now.ToString();
                        string sqlvisitation = "insert into Visitation_Information(RecordID,BillID,MemberID,Working,Location,Visitation) values('" + rid + "','" + rid + "','" + Convert.ToString(Session["IDLogin"]) + "','Deletion, successful','Bill','" + time + "')";
                        dataOperate.execSQL(sqlvisitation);

                    }

                }
            }
            DropDownList1.Visible = true;
            string a1 = DropDownList6.SelectedValue;

            string sql3 = "select distinct(" + a1 + "ID) from Bill_Information";
            DataSet ds3 = new DataSet();
            ds3 = dataOperate.getDataset(sql3, "Bill_Information");
            DataView rowview3 = ds3.Tables["Bill_Information"].DefaultView;
            DropDownList1.DataSource = rowview3;
            DropDownList1.DataValueField = "" + a1 + "ID";
            DropDownList1.DataBind();

            string sqlallMember = "select * from Bill_Information join Member_Information on Bill_Information.PatientID=Member_Information.MemberID";
            this.GridView1.Visible = true;
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "All";
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Bill_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
    }

    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList1.Visible = true;
        string a = DropDownList6.SelectedValue;
        string b = DropDownList1.SelectedValue;

        if (a == "Patient")
            a = "Member";

        string sql = "select distinct(" + a + "ID) from Bill_Information";
        DataSet ds = new DataSet();
        ds = dataOperate.getDataset(sql, "Bill_Information");
        DataView rowview = ds.Tables["Bill_Information"].DefaultView;
        DropDownList1.DataSource = rowview;
        DropDownList1.DataValueField = "" + a + "ID";
        DropDownList1.DataBind();
        
    }
}