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
            Session["search"] = sqlallMember;
            pid.Text = Request.QueryString["PatientID"];
            rid.Text = Request.QueryString["RecordID"];
            bid.Text = Request.QueryString["BillID"];
            did.Text = Request.QueryString["DoctorID"];

            string sql = "select MedicinetypeName from Medicinetype_Information";
            DataSet ds1 = new DataSet();
            ds1 = dataOperate.getDataset(sql, "Medicinetype_Information");
            DataView rowview1 = ds1.Tables["Medicinetype_Information"].DefaultView;
            //DropDownList8.DataSource = rowview1;
            //DropDownList8.DataValueField = "MedicinetypeName";
            //DropDownList8.DataBind();

            //DropDownList9.Visible = true;
            //string a = DropDownList8.SelectedValue;
            //string b = DropDownList10.SelectedValue;

            //string sql2 = "select Medicine" + b + " from Medicine_Information where MedicineType='" + a + "'";
            //DataSet ds2 = new DataSet();
            //ds2 = dataOperate.getDataset(sql2, "Medicine_Information");
            //DataView rowview2 = ds2.Tables["Medicine_Information"].DefaultView;
            //DropDownList9.DataSource = rowview2;
            //DropDownList9.DataValueField = "Medicine" + b + "";
            //DropDownList9.DataBind();

            //if (b == "ID")
            //    b = "Name";
            //else
            //    b = "ID";

            //string sql3 = "select * from Medicine_Information where MedicineType='" + a + "'";
            //DataSet ds3 = new DataSet();
            //ds3 = dataOperate.getDataset(sql3, "Medicine_Information");
            //int count1=ds3.Tables["Medicine_Information"].Rows.Count;
            //if (count1!=0)
            //{
            //    DataRowView rowview3 = ds3.Tables["Medicine_Information"].DefaultView[0];
            //    this.Label19.Text = rowview3["Medicine" + b + ""].ToString();
            //    this.Label20.Text = rowview3["MedicinePrice"].ToString();
            //}
            //else
            //{
            //    this.Label19.Text = "";
            //    this.Label20.Text = "";
            //}
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

}