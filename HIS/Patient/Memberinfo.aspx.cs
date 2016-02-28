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

public partial class Memberinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.ImageButton1.Visible = false;
            DataSet ds = new DataSet();
            DataSet ds2 = new DataSet();
            ds = dataOperate.getDataset("select * from Member_Information where MemberID = '" + Convert.ToString(Session["IDLogin"]) + "'", "Member_Information");
            ds2 = dataOperate.getDataset("select * from Login_Information where MemberID = '" + Convert.ToString(Session["IDLogin"]) + "'", "Login_Information");
            if (ds.Tables["Member_Information"].Rows.Count > 0 && ds2.Tables["Login_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Member_Information"].DefaultView[0];
                DataRowView rowview2 = ds2.Tables["Login_Information"].DefaultView[0];
                this.xuehao.Text = rowview["MemberID"].ToString();
                this.mima.Text = rowview2["MemberPassword"].ToString();
                this.xingming.Text = rowview["MemberName"].ToString();
                this.xingbie.Text = rowview["MemberGender"].ToString();
                this.banji.Text = rowview["MemberDepartment"].ToString();
                this.youxiang.Text = rowview["MemberEmail"].ToString();
                this.dizhi.Text = rowview["MemberAddress"].ToString();
                this.lianxifangshi.Text = rowview["MemberTel"].ToString();
                Session["Department"] = rowview["MemberDepartment"].ToString();
                ds.Clear();
            }
        }
    }
    protected void xiugai_Click(object sender, EventArgs e)
    {
        ImageButton1.Visible = true;
        //xuehao.ReadOnly = false;
        mima.ReadOnly = false;
        xingming.ReadOnly = false;
        xingbie.Visible = false;
        DropDownList3.Visible = true;
        //banji.Visible = false;
        //DropDownList4.Visible = true;
        youxiang.ReadOnly = false;
        dizhi.ReadOnly = false;
        lianxifangshi.ReadOnly = false;
        DropDownList3.SelectedValue = xingbie.Text;
        DropDownList4.SelectedValue = banji.Text;
        xiugai.Visible = false;
        tijiao.Visible = true;
    }
    protected void tijiao_Click(object sender, EventArgs e)
    {
        string xh = xuehao.Text;
        string mm = mima.Text;
        string xm = xingming.Text;
        string xb = DropDownList3.SelectedValue.ToString();
        string bj = DropDownList4.SelectedValue.ToString();
        string yx = youxiang.Text;
        string dz = dizhi.Text;
        string dh = lianxifangshi.Text;

        string sqltj = "update Member_Information set MemberID='" + xh + "',MemberName='" + xm + "',MemberGender='" + xb + "',MemberDepartment='" + bj + "',MemberEmail='" + yx + "',MemberAddress='" + dz + "',MemberTel='" + dh + "' where MemberID='" + Convert.ToString(Session["IDLogin"]) + "'";
        string sqltj1 = "update Login_Information set MemberID='" + xh + "', MemberPassword='" + mm + "' where MemberID='" + Convert.ToString(Session["IDLogin"]) + "'";
        if (dataOperate.execSQL(sqltj) && dataOperate.execSQL(sqltj1))
        {
            RegisterStartupScript("", "<script>alert('Edit personal information successful！')</script>");
            //Response.Write("<script>alert('添加学生成功！');location.href='xuesheng.aspx';</script>");
            xuehao.ReadOnly = true;
            xingming.ReadOnly = true;
            xingbie.Visible = true;
            DropDownList3.Visible = false;
            banji.Visible = true;
            DropDownList4.Visible = false;
            youxiang.ReadOnly = true;
            dizhi.ReadOnly = true;
            lianxifangshi.ReadOnly = true;
            xiugai.Visible = true;
            tijiao.Visible =false;
            Session["Password"] = mm;
        }
        else
        {
            RegisterStartupScript("", "<script>alert('Sorry, edit personal information failed！')</script>");
            xuehao.ReadOnly = true;
            xingming.ReadOnly = true;
            xingbie.Visible = true;
            DropDownList3.Visible = false;
            banji.Visible = true;
            DropDownList4.Visible = false;
            youxiang.ReadOnly = true;
            dizhi.ReadOnly = true;
            lianxifangshi.ReadOnly = true;
            xiugai.Visible = true;
            tijiao.Visible = false;
        }
    }
    //protected void shanchu_Click(object sender, EventArgs e)
    //{
    //    string xh = xuehao.Text;

    //    string sql = "delete from Member_Information where MemberID='" + xh + "'";

    //    if (dataOperate.execSQL(sql))
    //    {
    //        Response.Write("<script>alert('Delete member successful！');location.href='Management.aspx';</script>");
    //    }
    //    else
    //    {
    //        Response.Write("<script>alert('Sorry, delete member failed！');location.href='Management.aspx';</script>");
    //    }
    //}

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //xuehao.Text = "";
        mima.Text = "";
        xingming.Text = "";
        youxiang.Text = "";
        dizhi.Text = "";
        lianxifangshi.Text = "";
    }
}