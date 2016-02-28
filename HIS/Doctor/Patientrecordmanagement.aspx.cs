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
            string sqlallMember = "select * from Record_Information join Authorization_Information on Record_Information.RecordID=Authorization_Information.RecordID and Record_Information.PatientID=Authorization_Information.PatientID join Member_Information on Record_Information.DoctorID=Member_Information.MemberID where Authorization_Information.AuthorizationID='"+Convert.ToString(Session["IDLogin"])+"'";

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
            Session["Department"] = "";
            Session["ID"] = "";
            string sql3 = "select distinct(Record_Information.PatientID) from Record_Information join Authorization_Information on Record_Information.RecordID=Authorization_Information.RecordID and Record_Information.PatientID=Authorization_Information.PatientID join Member_Information on Record_Information.DoctorID=Member_Information.MemberID where Authorization_Information.AuthorizationID='"+Convert.ToString(Session["IDLogin"])+"'";
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
            DropDownList2.DataSource = rowview2;
            DropDownList2.DataValueField = "MemberID";
            DropDownList2.DataBind();
            Session["search"] = sqlallMember;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlallMember = "select * from Record_Information join Authorization_Information on Record_Information.RecordID=Authorization_Information.RecordID and Record_Information.PatientID=Authorization_Information.PatientID join Member_Information on Record_Information.DoctorID=Member_Information.MemberID where Authorization_Information.AuthorizationID='" + Convert.ToString(Session["IDLogin"]) + "'";
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
        sqlallMember = "select * from Record_Information join Authorization_Information on Record_Information.RecordID=Authorization_Information.RecordID and Record_Information.PatientID=Authorization_Information.PatientID join Member_Information on Record_Information.DoctorID=Member_Information.MemberID where Authorization_Information.AuthorizationID='" + Convert.ToString(Session["IDLogin"]) + "' and Record_Information.PatientID='" + drbj + "'";
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        string id = DropDownList2.SelectedValue.ToString();
        string recordid = record.Text;
        string xm = xingming.Text;

        string sqltj1 = "insert into Record_Information(DoctorID,PatientID,RecordID) values('" + Convert.ToString(Session["IDLogin"]) + "','" + id + "','" + recordid + "')";

        if (dataOperate.execSQL(sqltj1))
        {
            RegisterStartupScript("", "<script>alert('Add record successful！')</script>");
            string sqlallMember = "select * from Record_Information join Authorization_Information on Record_Information.RecordID=Authorization_Information.RecordID and Record_Information.PatientID=Authorization_Information.PatientID join Member_Information on Record_Information.DoctorID=Member_Information.MemberID where Authorization_Information.AuthorizationID='" + Convert.ToString(Session["IDLogin"]) + "'";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Record_Information");
            if (ds.Tables["Record_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Record_Information"].DefaultView[0];
                this.Label11.Text = rowview["PatientID"].ToString();
                this.Label10.Visible = true;
                this.Label11.Visible = true;
                ds.Clear();
            }
            this.GridView1.Visible = true;
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Record_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;

            string time = DateTime.Now.ToString();
            string sqlvisitation = "insert into Visitation_Information(RecordID,MemberID,Working,Location,Visitation) values('" + recordid + "','" + Convert.ToString(Session["IDLogin"]) + "','Creation, successful','Record','" + time + "')";
            dataOperate.execSQL(sqlvisitation);
            //Response.Write("<script>alert('添加学生成功！');location.href='xuesheng.aspx';</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('Sorry，add record failed！')</script>");
            string sqlallMember = "select * from Record_Information join Authorization_Information on Record_Information.RecordID=Authorization_Information.RecordID and Record_Information.PatientID=Authorization_Information.PatientID join Member_Information on Record_Information.DoctorID=Member_Information.MemberID where Authorization_Information.AuthorizationID='" + Convert.ToString(Session["IDLogin"]) + "'";
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

            string time = DateTime.Now.ToString();
            string sqlvisitation = "insert into Visitation_Information(RecordID,MemberID,Working,Location,Visitation) values('" + recordid + "','" + Convert.ToString(Session["IDLogin"]) + "','Creation, successful','Record','" + time + "')";
            dataOperate.execSQL(sqlvisitation);

        }
        record.Text = "";
        this.DropDownList1.DataBind();
        this.DropDownList2.DataBind();
        string sql3 = " select distinct(PatientID) from Record_Information join Member_Information on Record_Information.PatientID=Member_Information.MemberID where Record_Information.DoctorID='" + Convert.ToString(Session["IDLogin"]) + "' and Member_Information.MemberDepartment='Patient'";
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
        DropDownList2.DataSource = rowview2;
        DropDownList2.DataValueField = "MemberID";
        DropDownList2.DataBind();
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


    protected void Button4_Click(object sender, EventArgs e)
    {
        string id = mid.Text;
        string name = xingming.Text;
        string sqltj1 = "insert into Member_Information(MemberID,MemberName,MemberDepartment) values('" + id + "','" + name + "','Patient')";
        if (dataOperate.execSQL(sqltj1))
        {
            RegisterStartupScript("", "<script>alert('Add member successful！')</script>");
            string sqlallMember = "select * from Record_Information join Authorization_Information on Record_Information.RecordID=Authorization_Information.RecordID and Record_Information.PatientID=Authorization_Information.PatientID join Member_Information on Record_Information.DoctorID=Member_Information.MemberID where Authorization_Information.AuthorizationID='" + Convert.ToString(Session["IDLogin"]) + "'";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Record_Information");
            if (ds.Tables["Record_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Record_Information"].DefaultView[0];
                this.Label11.Text = "All Record";
                this.Label10.Visible = true;
                this.Label11.Visible = true;
                ds.Clear();
            }
            this.GridView1.Visible = true;
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Record_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
        }
        else
        {
            RegisterStartupScript("", "<script>alert('Sorry，add member failed！')</script>");
            string sqlallMember = "select * from Record_Information join Authorization_Information on Record_Information.RecordID=Authorization_Information.RecordID and Record_Information.PatientID=Authorization_Information.PatientID join Member_Information on Record_Information.DoctorID=Member_Information.MemberID where Authorization_Information.AuthorizationID='" + Convert.ToString(Session["IDLogin"]) + "'";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Record_Information");
            if (ds.Tables["Record_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Record_Information"].DefaultView[0];
                this.Label11.Text = "ALL Record";
                this.Label10.Visible = true;
                this.Label11.Visible = true;
                ds.Clear();
            }
            this.GridView1.Visible = true;
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Record_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;

        }
        mid.Text = "";
        xingming.Text = "";
        this.DropDownList1.DataBind();
        this.DropDownList2.DataBind();
        string sql3 = " select distinct(PatientID) from Record_Information join Member_Information on Record_Information.PatientID=Member_Information.MemberID where Record_Information.DoctorID='" + Convert.ToString(Session["IDLogin"]) + "' and Member_Information.MemberDepartment='Patient'";
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
        DropDownList2.DataSource = rowview2;
        DropDownList2.DataValueField = "MemberID";
        DropDownList2.DataBind();

    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        string sqlallMember;
        this.Label10.Visible = false;
        this.Label11.Visible = false;
        string drbj = sid.Text;
        DataSet ds = new DataSet();
        sqlallMember = "select * from Record_Information join Authorization_Information on Record_Information.RecordID=Authorization_Information.RecordID and Record_Information.PatientID=Authorization_Information.PatientID join Member_Information on Record_Information.DoctorID=Member_Information.MemberID where Authorization_Information.AuthorizationID='" + Convert.ToString(Session["IDLogin"]) + "' and Record_Information.RecordID='"+drbj+"'";
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

    protected void auth_Click(object sender, EventArgs e)
    {
        int cont = this.GridView1.Rows.Count;

        for (int i = 0; i < cont; i++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CB");
            if (cb.Checked == true)
            {
                string rid = GridView1.Rows[i].Cells[3].Text;
                string did = GridView1.Rows[i].Cells[1].Text;
                string pid = GridView1.Rows[i].Cells[2].Text;
                string authid = authdid.SelectedValue.ToString();
                string sqlr = "insert into Authorization_Information(AuthorizationID,DoctorID,PatientID,RecordID) values('" + authid + "','" + Convert.ToString(Session["IDLogin"]) + "','" + pid + "','" + rid + "')";
                if (dataOperate.execSQL(sqlr))
                {
                    RegisterStartupScript("", "<script>alert('Authorization Successful！')</script>");

                }
                else
                {
                    RegisterStartupScript("", "<script>alert('Authorization failed！')</script>");


                }

            }
        }
    }

    protected void unauth_Click(object sender, EventArgs e)
    {
        int cont = this.GridView1.Rows.Count;

        for (int i = 0; i < cont; i++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CB");
            if (cb.Checked == true)
            {
                string rid = GridView1.Rows[i].Cells[3].Text;
                string did = GridView1.Rows[i].Cells[1].Text;
                string pid = GridView1.Rows[i].Cells[2].Text;
                string authid = authdid.SelectedValue.ToString();
                string sqlr = "delete Authorization_Information where DoctorID='" + did + "' and RecordID='" + rid + "' and PatientID='" + pid + "' and AuthorizationID='" + authid + "'";
                if (dataOperate.execSQL(sqlr))
                {
                    RegisterStartupScript("", "<script>alert('Anti-Authorization Successful！')</script>");

                }
                else
                {
                    RegisterStartupScript("", "<script>alert('Anti-Authorization failed！')</script>");


                }

            }
        }
    }
}