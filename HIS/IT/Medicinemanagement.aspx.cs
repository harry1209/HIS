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
            string sqlallMember = "select * from Medicine_Information";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            if (ds.Tables["Medicine_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Medicine_Information"].DefaultView[0];
                this.Label11.Text = "All";
                this.Label10.Visible = true;
                this.Label11.Visible = true;
                ds.Clear();
            }

            this.GridView1.Visible = true;
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlallMember = "select * from Medicine_Information";
        this.GridView1.Visible = true;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.Label11.Text = "All";
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string sqlallMember;
        this.Label10.Visible = false;
        this.Label11.Visible = false;
        string drbj = DropDownList1.SelectedValue.ToString();
        if (drbj=="")
        {
            RegisterStartupScript("", "<script>alert('Add member successful！')</script>");

        }
        else
        {
            sqlallMember = "select * from Medicine_Information where MedicineType='" + drbj + "'";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            if (ds.Tables["Medicine_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Medicine_Information"].DefaultView[0];
                this.Label11.Text = rowview["MedicineType"].ToString();
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
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
        }
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string id = xuehao.Text;
        string name = xingming.Text;
        string type = DropDownList4.SelectedValue.ToString();
        string price = TextBox1.Text;


        string sqltj1 = "insert into Medicine_Information(MedicineID,MedicineName,MedicineType,MedicinePrice) values('" + id + "','" + name + "','"+type+"','"+price+"')";
        if (type!=""&&dataOperate.execSQL(sqltj1))
        {
            RegisterStartupScript("", "<script>alert('Add member successful！')</script>");
            string sqlallMember = "select * from Medicine_Information where MedicineType='" + type + "'";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            if (ds.Tables["Medicine_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Medicine_Information"].DefaultView[0];
                this.Label11.Text = rowview["MedicineType"].ToString();
                this.Label10.Visible = true;
                this.Label11.Visible = true;
                ds.Clear();
            }
            this.GridView1.Visible = true;
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;

            //Response.Write("<script>alert('添加学生成功！');location.href='xuesheng.aspx';</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('Sorry，add member failed！')</script>");
            string sqlallMember = "select * from Medicine_Information where MedicineType='" + type + "'";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            if (ds.Tables["Medicine_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Medicine_Information"].DefaultView[0];
                this.Label11.Text = rowview["MedicineType"].ToString();
                this.Label10.Visible = true;
                this.Label11.Visible = true;
                ds.Clear();
            }
            this.GridView1.Visible = true;
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;

        }
        xuehao.Text = "";
        xingming.Text = "";

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string bhtj = banhao.Text;
        string sqltjbh = "insert into Medicinetype_Information values('" + bhtj + "')";
        if (dataOperate.execSQL(sqltjbh) && bhtj!="")
        {
            //Response.Write("<script>alert('添加班级成功！');location.href='xuesheng.aspx';</script>");
            RegisterStartupScript("", "<script>alert('Add department successful！')</script>");
            this.DropDownList1.DataBind();
            this.DropDownList4.DataBind();
            this.DropDownList5.DataBind();
            this.Label10.Visible = false;
            this.Label11.Visible = false;
            
            string drbj = DropDownList1.SelectedValue.ToString();
            string sqlallMember = "select * from Medicine_Information";
            DataSet ds = new DataSet();
            ds = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            if (ds.Tables["Medicine_Information"].Rows.Count > 0)
            {
                DataRowView rowview = ds.Tables["Medicine_Information"].DefaultView[0];
                this.Label11.Text = rowview["MedicineType"].ToString();
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
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
        }
        else
        {
            RegisterStartupScript("", "<script>alert('Sorry，add department failed！')</script>");
            this.DropDownList1.DataBind();
            this.DropDownList4.DataBind();
            this.DropDownList5.DataBind();
            string sqlallMember = "select * from Medicine_Information";
            this.GridView1.Visible = true;
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "All";
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;

        }
        banhao.Text = "";
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        string bhtj = banhao.Text;
        string sqltjbh = "delete Medicinetype_Information where MedicinetypeName= '" + bhtj + "'";
        string sqltjbh1 = "update Medicine_Information set MedicineType='None' where MedicineType='" + bhtj + "'";
        int a=0;
        a=dataOperate.SqlENQ(sqltjbh);
        //if (bhtj != "None" && bhtj != "" && dataOperate.execSQL(sqltjbh) && dataOperate.execSQL(sqltjbh1))
        if(a>0&& bhtj != "" && dataOperate.execSQL(sqltjbh)&&dataOperate.execSQL(sqltjbh1))
        {
            
            RegisterStartupScript("", "<script>alert('Delete department successful！')</script>");
            this.DropDownList1.DataBind();
            this.DropDownList4.DataBind();
            this.DropDownList5.DataBind();
            string sqlallMember = "select * from Medicine_Information";
            this.GridView1.Visible = true;
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "All";
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
        }
        else
        {
            //Response.Write("<script>alert('对不起，删除班级失败！');location.href='Management.aspx';</script>");
            RegisterStartupScript("", "<script>alert('Sorry，delete department failed！')</script>");
            this.DropDownList1.DataBind();
            this.DropDownList4.DataBind();
            this.DropDownList5.DataBind();
            string sqlallMember = "select * from Medicine_Information";
            this.GridView1.Visible = true;
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "All";
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
        }
    }


    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/IT/Medicineinsert.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.Label10.Visible = true;
        this.Label11.Visible = true;
        this.GridView1.DataSource = dataOperate.getDataset(Convert.ToString(Session["search"]), "Member_Information");
        this.GridView1.DataBind();
    }





    protected void Button7_Click(object sender, EventArgs e)
    {
            int cont = this.GridView1.Rows.Count;

            for (int i = 0; i < cont; i++)
            {
                CheckBox cb =(CheckBox) GridView1.Rows[i].FindControl("CB");
                if (cb.Checked == true)
                {
                    string rid = GridView1.Rows[i].Cells[1].Text;
                    string sqlr = "update Medicine_Information set MedicineType='" + DropDownList5.Text + "' where MedicineID='" + rid + "'";
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
            this.DropDownList1.DataBind();
            this.DropDownList4.DataBind();
            this.DropDownList5.DataBind();
            string sqlallMember = "select * from Medicine_Information";
            this.GridView1.Visible = true;
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "All";
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
        }



    protected void DSD_Click(object sender, EventArgs e)
    {
            int cont = this.GridView1.Rows.Count;

            for (int i = 0; i < cont; i++)
            {
                CheckBox cb =(CheckBox) GridView1.Rows[i].FindControl("CB");
                if (cb.Checked == true)
                {
                    string rid = GridView1.Rows[i].Cells[1].Text;
                    string sqlr = "Delete Medicine_Information where MedicineID='" + rid + "'";
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
            this.DropDownList4.DataBind();
            this.DropDownList5.DataBind();
            string sqlallMember = "select * from Medicine_Information";
            this.GridView1.Visible = true;
            this.Label10.Visible = true;
            this.Label11.Visible = true;
            this.Label11.Text = "All";
            this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
            this.GridView1.DataBind();
            Session["search"] = sqlallMember;
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        string sqlallMember;
        this.Label10.Visible = false;
        this.Label11.Visible = false;
        string drbj = sid.Text;

        sqlallMember = "select * from Medicine_Information where MedicineID='" + drbj + "'";
        DataSet ds = new DataSet();
        ds = dataOperate.getDataset(sqlallMember, "Medicine_Information");
        if (ds.Tables["Medicine_Information"].Rows.Count > 0)
        {
            DataRowView rowview = ds.Tables["Medicine_Information"].DefaultView[0];
            this.Label11.Text = "ID: "+drbj+"";
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
        this.GridView1.DataSource = dataOperate.getDataset(sqlallMember, "Medicine_Information");
        this.GridView1.DataBind();
        Session["search"] = sqlallMember;
    }
    
}