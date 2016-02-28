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
            this.ImageButton1.Visible = false;
            DataSet ds = new DataSet();
            DataSet ds2 = new DataSet();
            ds = dataOperate.getDataset("select * from Medicine_Information where MedicineID='" + Request.QueryString["MedicineID"] + "' and MedicineName='" + Request.QueryString["MedicineName"] + "'", "Medicine_Information");
            
            if (ds.Tables["Medicine_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Medicine_Information"].DefaultView[0];
                //DataRowView rowview2 = ds2.Tables["Login_Information"].DefaultView[0];
                this.mid.Text = rowview["MedicineID"].ToString();
                this.xingming.Text = rowview["MedicineName"].ToString();
                this.mtype.Text = rowview["MedicineType"].ToString();
                this.mp.Text = rowview["MedicinePrice"].ToString();
                this.md.Text=rowview["MedicineInfo"].ToString();
                //Session["Department"] = rowview["MemberDepartment"].ToString();
                ds.Clear();
            }
        }
    }
    protected void xiugai_Click(object sender, EventArgs e)
    {
        ImageButton1.Visible = true;
        mid.ReadOnly = false;
        xingming.ReadOnly = false;
        mtype.Visible = false;
        mp.ReadOnly = false;
        xiugai.Visible = false;
        tijiao.Visible = true;
        md.ReadOnly=false;
        DropDownList4.Visible = true;
    }
    protected void tijiao_Click(object sender, EventArgs e)
    {
        string id = mid.Text;
        string xm = xingming.Text;
        string price = mp.Text;
        string info = md.Text;
        string type=DropDownList4.SelectedValue;

        string sqltj1="update Medicine_Information set MedicineID='"+id+"',MedicineName='"+xm+ "',MedicinePrice='" + price + "',MedicineType='" + type + "',MedicineInfo='" + info + "' where MedicineID='" + Request.QueryString["MedicineID"] + "' and MedicineName='" + Request.QueryString["MedicineName"] + "'";
        if (dataOperate.execSQL(sqltj1))
        {
            RegisterStartupScript("", "<script>alert('Edit record information successful！')</script>");
            //Response.Write("<script>alert('添加学生成功！');location.href='xuesheng.aspx';</script>");
            mid.ReadOnly = true;
            xingming.ReadOnly = true;
            DropDownList4.Visible = true;
            mp.ReadOnly = true;
            xiugai.Visible = true;
            tijiao.Visible =false;
            md.ReadOnly = true;
        }
        else
        {
            RegisterStartupScript("", "<script>alert('Sorry，edit record information failed！')</script>");
            mid.ReadOnly = true;
            xingming.ReadOnly = true;
            DropDownList4.Visible = true;
            mp.ReadOnly = true;
            xiugai.Visible = true;
            tijiao.Visible = false;
            md.ReadOnly = true;

        }
    }
    protected void shanchu_Click(object sender, EventArgs e)
    {
        string sql = "delete from Medicine_Information where MedicineID='" + Request.QueryString["MedicineID"] + "' and MedicineName='" + Request.QueryString["MedicineName"] + "'";

        if (dataOperate.execSQL(sql))
        {
            Response.Write("<script>alert('Delete record successful！');location.href='Medicinemanagement.aspx';</script>");

        }
        else
        {
            Response.Write("<script>alert('Sorry, record member failed！');location.href='Medicinemanagement.aspx';</script>");

        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        xingming.Text = "";
        mid.Text = "";
        mp.Text = "";
        md.Text = "";
    }
}