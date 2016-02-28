using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
public partial class Billview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //this.ImageButton1.Visible = false;
            string sqlallMember = "select * from Billdetail_Information where BillID='" + Request.QueryString["BillID"] + "' and RecordID='" + Request.QueryString["RecordID"] + "'";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset("select * from Member_Information where MemberID='" + Request.QueryString["PatientID"] + "'", "Member_Information");

            if (ds.Tables["Member_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Member_Information"].DefaultView[0];
                this.xingming.Text = rowview["MemberName"].ToString();
                ds.Clear();
            }
            
            this.GridView1.Visible = true;
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Billdetail_Information");
            this.GridView1.DataBind();
            pid.Text = Request.QueryString["PatientID"];
            rid.Text = Request.QueryString["RecordID"];
            bid.Text = Request.QueryString["BillID"];
            did.Text = Request.QueryString["DoctorID"];

            string sql = "select MedicinetypeName from Medicinetype_Information";
            DataSet ds1 = new DataSet();
            ds1 = dataOperate.getDataset(sql, "Medicinetype_Information");
            DataView rowview1 = ds1.Tables["Medicinetype_Information"].DefaultView;
//            DropDownList8.DataSource = rowview1;
//            DropDownList8.DataValueField = "MedicinetypeName";
//            DropDownList8.DataBind();

//            DropDownList9.Visible = true;
//            string a = DropDownList8.SelectedValue;
//            string b = DropDownList10.SelectedValue;

            //string sql2 = "select Medicine" + b + " from Medicine_Information where MedicineType='" + a + "'";
            //DataSet ds2 = new DataSet();
            //ds2 = dataOperate.getDataset(sql2, "Medicine_Information");
            //DataView rowview2 = ds2.Tables["Medicine_Information"].DefaultView;
//            DropDownList9.DataSource = rowview2;
//            DropDownList9.DataValueField = "Medicine" + b + "";
//            DropDownList9.DataBind();

            //if (b == "ID")
            //    b = "Name";
            //else
            //    b = "ID";

            //string sql3 = "select * from Medicine_Information where MedicineType='" + a + "'";
            //DataSet ds3 = new DataSet();
            //ds3 = dataOperate.getDataset(sql3, "Medicine_Information");
            //DataRowView rowview3 = ds3.Tables["Medicine_Information"].DefaultView[0];
            //this.Label19.Text = rowview3["Medicine"+b+""].ToString();
            //this.Label20.Text = rowview3["MedicinePrice"].ToString();
        }
    }

    protected void shanchu_Click(object sender, EventArgs e)
    {

        string sql = "delete from Record_Information where BillID='" + Request.QueryString["BillID"] + "' and RecordID='" + Request.QueryString["RecordID"] + "'";

        if (dataOperate.execSQL(sql))
        {
            Response.Write("<script>alert('Delete record successful！');location.href='Billmanagement.aspx';</script>");
            string time = DateTime.Now.ToString();
            string sqlvisitation = "insert into Visitation_Information(RecordID,MemberID,Working,Location,Visitation) values('" + Request.QueryString["RecordID"] + "','" + Convert.ToString(Session["IDLogin"]) + "','Deletion,successful','Record','" + time + "')";
            dataOperate.execSQL(sqlvisitation);
        }
        else
        {
            Response.Write("<script>alert('Sorry, record member failed！');location.href='Billmanagement.aspx';</script>");
            string time = DateTime.Now.ToString();
            string sqlvisitation = "insert into Visitation_Information(RecordID,MemberID,Working,Location,Visitation) values('" + Request.QueryString["RecordID"] + "','" + Convert.ToString(Session["IDLogin"]) + "','Deletion,successful','Record','" + time + "')";
            dataOperate.execSQL(sqlvisitation);
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //xuehao.Text = "";
        //rid.Text = "";
        //xingming.Text = "";
        //youxiang.Text = "";
        //dizhi.Text = "";
        //lianxifangshi.Text = "";
    }
    protected void DSD_Click(object sender, EventArgs e)
    {
        int cont = this.GridView1.Rows.Count;

        for (int i = 0; i < cont; i++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CB");
            if (cb.Checked == true)
            {
                string rid1 = GridView1.Rows[i].Cells[2].Text;
                string sqlr = "Delete Billdetail_Information where BillID='" + Request.QueryString["BillID"] + "' and BillItemID='" + rid1 + "'";
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
//        this.ImageButton1.Visible = false;
        string sqlallMember = "select * from Billdetail_Information where BillID='" + Request.QueryString["BillID"] + "'";
        DataSet ds = new DataSet();
        ds = dataOperate.getDataset("select * from Member_Information where MemberID='" + Request.QueryString["MemberID"] + "'", "Member_Information");

        if (ds.Tables["Member_Information"].Rows.Count > 0)
        {
            DataRowView rowview = ds.Tables["Member_Information"].DefaultView[0];
            this.xingming.Text = rowview["MemberName"].ToString();
            ds.Clear();
        }

        this.GridView1.Visible = true;
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Billdetail_Information");
        this.GridView1.DataBind();
        pid.Text = Request.QueryString["MemberID"];
        rid.Text = Request.QueryString["RecordID"];
        bid.Text = Request.QueryString["BillID"];
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        int cont = this.GridView1.Rows.Count;
        string quan = mquan.Text;
        for (int i = 0; i < cont; i++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CB");
            if (cb.Checked == true)
            {
                string rid1 = GridView1.Rows[i].Cells[2].Text;
                string sqlr = "update Billdetail_Information set BillItemQuantity='" + quan + "' where BillItemID='" + rid1 + "' and BillID='" + Request.QueryString["BillID"] + "'";
                if (dataOperate.execSQL(sqlr))
                {
                    RegisterStartupScript("", "<script>alert('Modify Successful！')</script>");
                }
                else
                {
                    RegisterStartupScript("", "<script>alert('Modify failed！')</script>");

                }

            }
        }
//        this.ImageButton1.Visible = false;
        string sqlallMember = "select * from Billdetail_Information where BillID='" + Request.QueryString["BillID"] + "'";
        DataSet ds = new DataSet();
        ds = dataOperate.getDataset("select * from Member_Information where MemberID='" + Request.QueryString["MemberID"] + "'", "Member_Information");

        if (ds.Tables["Member_Information"].Rows.Count > 0)
        {
            DataRowView rowview = ds.Tables["Member_Information"].DefaultView[0];
            this.xingming.Text = rowview["MemberName"].ToString();
            ds.Clear();
        }

        this.GridView1.Visible = true;
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Billdetail_Information");
        this.GridView1.DataBind();
        pid.Text = Request.QueryString["MemberID"];
        rid.Text = Request.QueryString["RecordID"];
        bid.Text = Request.QueryString["BillID"];
    }

    private double sum1 = 0;//取指定列的数据和，你要根据具体情况对待可能你要处理的是int
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowIndex >= 0)
        {
            sum1 += Convert.ToDouble(e.Row.Cells[5].Text) * Convert.ToDouble(e.Row.Cells[6].Text);
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[4].Text = "Sum：";
            e.Row.Cells[5].Text = sum1.ToString();
            Label19.Text = sum1.ToString();
        }

    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        string sum = Label19.Text;
        string sqltjsum = "update Bill_Information set BillPrice ='" + sum + "' where PatientID='" + Request.QueryString["PatientID"] + "' and DoctorID='" + Request.QueryString["DoctorID"] + "' and RecordID='" + Request.QueryString["RecordID"] + "' and BillID='" + Request.QueryString["BillID"] + "'";
        if (dataOperate.execSQL(sqltjsum) && sum != "")
        {
            RegisterStartupScript("", "<script>alert('Add BillPrice successful！')</script>");

        }
        else
        {
            RegisterStartupScript("", "<script>alert('Sorry，add BillPrice failed！')</script>");
        }
    }
}