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
public partial class Recordview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //this.ImageButton1.Visible = false;
            DataSet ds = new DataSet();
            DataSet ds2 = new DataSet();
            ds= dataOperate.getDataset("select * from Record_Information join Member_Information on Record_Information.PatientID=Member_Information.MemberID and Record_Information.PatientID='" + Request.QueryString["PatientID"] + "' and Record_Information.RecordID='"+Request.QueryString["RecordID"]+"' and Record_Information.DoctorID='"+Request.QueryString["DoctorID"]+"'","Record_Information");
            
            if (ds.Tables["Record_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Record_Information"].DefaultView[0];
                //DataRowView rowview2 = ds2.Tables["Login_Information"].DefaultView[0];
                this.xuehao.Text = rowview["PatientID"].ToString();
                this.rid.Text = rowview["RecordID"].ToString();
                this.did.Text=rowview["DoctorID"].ToString();
                this.xingming.Text = rowview["MemberName"].ToString();
                this.xingbie.Text = rowview["MemberGender"].ToString();
                this.youxiang.Text = rowview["MemberEmail"].ToString();
                this.dizhi.Text = rowview["MemberAddress"].ToString();
                this.lianxifangshi.Text = rowview["MemberTel"].ToString();
                this.liuyan.Text=rowview["RecordContent"].ToString();
                //Session["Department"] = rowview["MemberDepartment"].ToString();
                ds.Clear();
            }
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
        liuyan.Text = "";
    }
}